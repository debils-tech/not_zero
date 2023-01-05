import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/services/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/domain/repositories/settings_repository.dart';

import '../global_init.dart';
import '../tasks/tasks_db_config.dart';
import '../tasks/template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();

  group('Themes', () {
    test('Get value', () async {
      final settingsBox = getIt<StorageProvider>().settings;
      final repository = getIt<SettingsRepository>();

      for (final value in ThemeState.values) {
        await settingsBox.put(SettingsKeys.themeState, value.name);
        expect(repository.loadThemeState(), value);
      }
    });

    test('Set value', () async {
      final repository = getIt<SettingsRepository>();

      for (final value in ThemeState.values) {
        await repository.saveThemeState(value);
        expect(repository.loadThemeState(), value);
      }
    });
  });

  group('Export & import', () {
    final tempSettings = {
      SettingsKeys.themeState: ThemeState.dark.name,
      'foo': 'bar',
    };
    final tempTasks = templateTasks1.map((e) => e.toJson()).toList();

    test('Export', () async {
      final settingsBox = getIt<StorageProvider>().settings;
      final repository = getIt<SettingsRepository>();
      final service = getIt<SettingsLocalService>();

      // Save some template settings
      await settingsBox.putAll(tempSettings);

      expect(await repository.exportData(), true);

      final backup = await service.importDataFromFile();
      expect(backup, isNotNull);

      expect(backup?.version, 1);
      expect(backup?.appInfo, await AppInfo.fromEnviroment());

      final backupData = backup!.data;
      expect(backupData[BoxNames.settings], tempSettings);
      expect(backupData[TableNames.tasks], tempTasks);
    });

    test('Wrong version import', () async {
      final repository = getIt<SettingsRepository>();
      final service = getIt<SettingsLocalService>();

      // Wrong version import is not allowed
      await service.exportDataToFile(BackupModel(version: 2, data: {}));
      expect(await repository.importData(), false);
    });

    test('Normal import', () async {
      final repository = getIt<SettingsRepository>();
      final service = getIt<SettingsLocalService>();

      await service.exportDataToFile(
        BackupModel(
          version: 1,
          // AppInfo doesn't matter for now
          data: {
            BoxNames.settings: tempSettings,
            TableNames.tasks: tempTasks,
          },
        ),
      );
      expect(await repository.importData(), true);

      expect(service.getAllSettings(), tempSettings);
      expect(await service.getAllTasks(), tempTasks);
    });
  });
}
