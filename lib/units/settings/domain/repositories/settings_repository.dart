import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/backup_local_service.dart';
import 'package:not_zero/units/settings/data/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';

@lazySingleton
class SettingsRepository {
  SettingsRepository(this._settingsLocalService, this._backupLocalService);

  final SettingsLocalService _settingsLocalService;
  final BackupLocalService _backupLocalService;

  final log = Logger('SettingsRepository');

  ThemeState loadThemeState() {
    return _settingsLocalService.getThemeState() ?? ThemeState.system;
  }

  Future<void> saveThemeState(ThemeState state) {
    return _settingsLocalService.setThemeState(state);
  }

  Future<bool> exportData() async {
    final Map<String, String> settings;
    final List<Map<String, dynamic>> tasks;
    final List<Map<String, dynamic>> tags;
    try {
      settings = _backupLocalService.getAllSettings();
      tasks = await _backupLocalService.getAllTasks();
      tags = await _backupLocalService.getAllTags();
    } catch (e, s) {
      log.severe('Error while getting info for export', e, s);
      return false;
    }

    final backupContent = BackupModel(
      version: 2,
      appInfo: getIt<AppInfo>(),
      data: {
        BoxNames.settings: settings,
        TableNames.tasks: tasks,
        TableNames.tags: tags,
      },
    );

    return _backupLocalService.exportDataToFile(backupContent);
  }

  Future<bool> importData() async {
    final backupContent = await _backupLocalService.importDataFromFile();
    if (backupContent == null) return false;

    // If version is not supported
    if (backupContent.version > 2 || backupContent.version < 1) return false;

    try {
      final rawSettings = backupContent.data[BoxNames.settings] as Map;
      await _backupLocalService.applyAllSettings(
        Map<String, String>.from(rawSettings),
      );

      final rawTags = backupContent.data[TableNames.tags] as List;
      await _backupLocalService.applyAllTags(
        rawTags.map((e) => Map<String, dynamic>.from(e as Map)).toList(),
      );

      final rawTasks = backupContent.data[TableNames.tasks] as List;
      await _backupLocalService.applyAllTasks(
        rawTasks.map((e) => Map<String, dynamic>.from(e as Map)).toList(),
      );
    } catch (e, s) {
      log.severe('Error while applying backup', e, s);
      return false;
    }

    return true;
  }
}
