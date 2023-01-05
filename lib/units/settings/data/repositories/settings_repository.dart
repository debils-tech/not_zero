import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/services/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl(this._localService);

  final SettingsLocalService _localService;

  @override
  ThemeState loadThemeState() {
    return _localService.getThemeState() ?? ThemeState.system;
  }

  @override
  Future<void> saveThemeState(ThemeState state) {
    return _localService.setThemeState(state);
  }

  @override
  Future<bool> exportData() async {
    final Map<String, String> settings;
    final List<Map<String, dynamic>> tasks;
    try {
      settings = _localService.getAllSettings();
      tasks = await _localService.getAllTasks();
    } catch (e, st) {
      debugPrint('Error while getting info for export: $e');
      debugPrintStack(stackTrace: st);
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

  @override
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
    } catch (e, st) {
      debugPrint('Error while applying backup: $e');
      debugPrintStack(stackTrace: st);
      return false;
    }

    return true;
  }
}
