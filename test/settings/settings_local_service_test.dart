import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/services/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/tasks/data/services/tasks_local_service.dart';

import '../global_init.dart';
import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();

  group('Themes', () {
    test('Get null', () {
      final service = getIt<SettingsLocalService>();

      expect(service.getThemeState(), isNull);
    });

    test('Set and get', () async {
      final service = getIt<SettingsLocalService>();
      final settingsBox = getIt<StorageProvider>().settings;

      await service.setThemeState(ThemeState.dark);
      expect(settingsBox.get(SettingsKeys.themeState), 'dark');
      expect(service.getThemeState(), ThemeState.dark);

      await service.setThemeState(ThemeState.light);
      expect(settingsBox.get(SettingsKeys.themeState), 'light');
      expect(service.getThemeState(), ThemeState.light);

      await service.setThemeState(ThemeState.system);
      expect(settingsBox.get(SettingsKeys.themeState), 'system');
      expect(service.getThemeState(), ThemeState.system);
    });
  });

  group('Data manipulations', () {
    test('Get all settings', () async {
      await getIt<StorageProvider>().settings.clear();
      final service = getIt<SettingsLocalService>();

      // Settings should be empty if nothing was set
      expect(service.getAllSettings(), isEmpty);

      // Setting should appear after changing
      await service.setThemeState(ThemeState.dark);
      expect(service.getAllSettings(), {SettingsKeys.themeState: 'dark'});
    });

    test('Apply all settings', () async {
      final service = getIt<SettingsLocalService>();

      await service.applyAllSettings({SettingsKeys.themeState: 'light'});
      expect(service.getThemeState(), ThemeState.light);

      await service.applyAllSettings({
        SettingsKeys.themeState: 'dark',
        'foo': 'bar',
      });
      expect(service.getThemeState(), ThemeState.dark);
      expect(getIt<StorageProvider>().settings.get('foo'), 'bar');

      // Resetting all keys
      await service.applyAllSettings({});
      expect(service.getThemeState(), isNull);
      expect(service.getAllSettings(), isEmpty);
    });

    test('Get all tasks', () async {
      final service = getIt<SettingsLocalService>();
      final tasksService = getIt<TasksLocalService>();

      final savedTasks = await service.getAllTasks();
      expect(savedTasks, templateTasks1.map((e) => e.toJson()).toList());

      // Clearing default tasks
      await tasksService.deleteTasks(templateTasks1.map((e) => e.id));
      // Making sure that here is no tasks
      expect(await service.getAllTasks(), isEmpty);
    });

    test('Apply all tasks', () async {
      final service = getIt<SettingsLocalService>();

      // Clear all tasks
      await service.applyAllTasks([]);
      expect(await service.getAllTasks(), <Map<String, dynamic>>[]);

      final rawTasks = templateTasks1.map((e) => e.toJson()).toList();
      await service.applyAllTasks(rawTasks);
      expect(await service.getAllTasks(), rawTasks);
    });
  });

  test('Export & import', () async {
    final service = getIt<SettingsLocalService>();

    expect(await service.importDataFromFile(), isNull);

    var backup = BackupModel(
      version: 1,
      data: {
        'settings': const <String, String>{},
        'tasks': templateTasks1.map((e) => e.toJson()).toList(),
      },
    );
    expect(await service.exportDataToFile(backup), true);
    expect(await service.importDataFromFile(), backup);

    backup = BackupModel(
      version: 69,
      appInfo: await AppInfo.fromEnviroment(),
      data: {
        'settings': {'foo': 'bar'},
        'tasks': const <Map<String, dynamic>>[],
      },
    );
    expect(await service.exportDataToFile(backup), true);
    expect(await service.importDataFromFile(), backup);
  });
}
