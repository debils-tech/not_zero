import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/settings/data/services/settings_local_service.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';

import '../global_init.dart';

void main() {
  globalInit();

  test('Get null', () {
    final service = getIt<SettingsLocalService>();

    expect(service.getThemeState(), isNull);
  });

  test('Set and get', () async {
    final service = getIt<SettingsLocalService>();
    final settingsBox = Hive.box<String>(BoxNames.settings);

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
}
