import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/backup_local_service.dart';
import 'package:not_zero/units/settings/data/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';

import '../../global_init.dart';
import '../../tags/tags_db_config.dart';
import '../../tasks/tasks_db_config.dart';
import '../../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();
  configDatabaseForTags();

  group('Settings backup', () {
    test('Get all settings', () async {
      await getIt<StorageProvider>().settings.clear();
      final service = getIt<BackupLocalService>();
      final settingsService = getIt<SettingsLocalService>();

      // Settings should be empty if nothing was set
      expect(service.getAllSettings(), isEmpty);

      // Setting should appear after changing
      await settingsService.setThemeState(ThemeState.dark);
      expect(service.getAllSettings(), {SettingsKeys.themeState: 'dark'});
    });

    test('Apply all settings', () async {
      final service = getIt<BackupLocalService>();
      final settingsService = getIt<SettingsLocalService>();

      await service.applyAllSettings({SettingsKeys.themeState: 'light'});
      expect(settingsService.getThemeState(), ThemeState.light);

      await service.applyAllSettings({
        SettingsKeys.themeState: 'dark',
        'foo': 'bar',
      });
      expect(settingsService.getThemeState(), ThemeState.dark);
      expect(getIt<StorageProvider>().settings.get('foo'), 'bar');

      // Resetting all keys
      await service.applyAllSettings({});
      expect(settingsService.getThemeState(), isNull);
      expect(service.getAllSettings(), isEmpty);
    });
  });

  group('Tasks backup', () {
    test('Get all tasks', () async {
      final service = getIt<BackupLocalService>();
      final tasksService = getIt<TasksLocalService>();

      final savedTasks = await service.getAllTasks();
      expect(savedTasks, templateTasks1.map((e) => e.toJson()).toList());

      // Clearing default tasks
      await tasksService.deleteTasks(templateTasks1.map((e) => e.id));
      // Making sure that here is no tasks
      expect(await service.getAllTasks(), isEmpty);
    });

    test('Apply all tasks', () async {
      final service = getIt<BackupLocalService>();

      // Clear all tasks
      await service.applyAllTasks([]);
      expect(await service.getAllTasks(), <Map<String, dynamic>>[]);

      final rawTasks = templateTasks1.map((e) => e.toJson()).toList();
      await service.applyAllTasks(rawTasks);
      expect(await service.getAllTasks(), rawTasks);
    });
  });

  test('Export & import', () async {
    final service = getIt<BackupLocalService>();

    expect(await service.importDataFromFile(), isNull);

    var backup = BackupModel(
      // This is normal here because "version" value will be changed
      // in the future.
      // ignore: avoid_redundant_argument_values
      version: 1,
      data: {
        BoxNames.settings: const <String, String>{},
        TableNames.tasks: templateTasks1.map((e) => e.toJson()).toList(),
      },
    );
    expect(await service.exportDataToFile(backup), true);
    expect(await service.importDataFromFile(), backup);

    backup = BackupModel(
      version: 69,
      appInfo: await AppInfo.fromEnviroment(),
      data: {
        BoxNames.settings: {'foo': 'bar'},
        TableNames.tasks: const <Map<String, dynamic>>[],
      },
    );
    expect(await service.exportDataToFile(backup), true);
    expect(await service.importDataFromFile(), backup);
  });
}
