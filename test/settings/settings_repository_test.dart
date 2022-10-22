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
}
