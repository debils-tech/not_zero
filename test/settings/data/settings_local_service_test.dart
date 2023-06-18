import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/data/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';

import '../../global_init.dart';
import '../../tasks/tasks_db_config.dart';
import '../../tasks/template_tasks.dart';

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
}
