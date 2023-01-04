import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
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
      settings = _localService.exportAllSettings();
      tasks = await _localService.exportAllTasks();
    } catch (e, st) {
      debugPrint('Error while getting info for export: $e');
      debugPrintStack(stackTrace: st);
      return false;
    }

    final backupContent = BackupModel(
      appInfo: getIt<AppInfo>(),
      data: {
        'settings': settings,
        'tasks': tasks,
      },
    );

    return _localService.exportDataToFile(backupContent.toJson());
  }

  @override
  Future<bool> importData() {
    // TODO(uSlashVlad): implement importData
    throw UnimplementedError();
  }
}
