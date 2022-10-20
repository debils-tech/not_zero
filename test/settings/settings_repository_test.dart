import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/settings/domain/repositories/settings_repository.dart';

import '../global_init.dart';

void main() {
  globalInit();

  test('Get value', () async {
    final settingsBox = Hive.box<String>(BoxNames.settings);
    final repository = getIt<SettingsRepository>();

    await settingsBox.put(SettingsKeys.themeState, ThemeState.dark.name);
    expect(repository.loadThemeState(), ThemeState.dark);

    await settingsBox.put(SettingsKeys.themeState, ThemeState.light.name);
    expect(repository.loadThemeState(), ThemeState.light);

    await settingsBox.put(SettingsKeys.themeState, ThemeState.system.name);
    expect(repository.loadThemeState(), ThemeState.system);
  });

  test('Set value', () async {
    final repository = getIt<SettingsRepository>();

    await repository.saveThemeState(ThemeState.dark);
    expect(repository.loadThemeState(), ThemeState.dark);

    await repository.saveThemeState(ThemeState.light);
    expect(repository.loadThemeState(), ThemeState.light);

    await repository.saveThemeState(ThemeState.system);
    expect(repository.loadThemeState(), ThemeState.system);
  });
}
