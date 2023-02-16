import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';

@lazySingleton
class SettingsRepository {
  SettingsRepository(this._localService);

  final SettingsLocalService _localService;

  final log = Logger('SettingsRepository');

  ThemeState loadThemeState() {
    return _localService.getThemeState() ?? ThemeState.system;
  }

  Future<void> saveThemeState(ThemeState state) {
    return _localService.setThemeState(state);
  }

  Future<bool> exportData() async {
    final Map<String, String> settings;
    final List<Map<String, dynamic>> tasks;
    try {
      settings = _localService.getAllSettings();
      tasks = await _localService.getAllTasks();
    } catch (e, s) {
      log.severe('Error while getting info for export', e, s);
      return false;
    }

    final backupContent = BackupModel(
      appInfo: getIt<AppInfo>(),
      data: {
        BoxNames.settings: settings,
        TableNames.tasks: tasks,
      },
    );

    return _localService.exportDataToFile(backupContent);
  }

  Future<bool> importData() async {
    final backupContent = await _localService.importDataFromFile();
    if (backupContent == null) return false;

    // If version is not supported
    if (backupContent.version != 1) return false;

    try {
      final rawSettings = backupContent.data[BoxNames.settings] as Map;
      await _localService.applyAllSettings(
        Map<String, String>.from(rawSettings),
      );
      final rawTasks = backupContent.data[TableNames.tasks] as List;
      await _localService.applyAllTasks(
        rawTasks.map((e) => Map<String, dynamic>.from(e as Map)).toList(),
      );
    } catch (e, s) {
      log.severe('Error while applying backup', e, s);
      return false;
    }

    return true;
  }
}
