// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:nz_boxes/nz_boxes.dart';
import 'package:nz_common/nz_common.dart';

class SettingsLocalService implements BaseService {
  const SettingsLocalService(this._settingsBox);

  final NotZeroSimpleBox _settingsBox;

  static final log = Logger('SettingsLocalService');

  static const _themeStateKey = 'themeState';
  static const _useDynamicColorsKey = 'useDynamicColors';
  static const _harmonizeColorsKey = 'harmonizeColors';

  ThemeState? getThemeState() {
    final stringValue = _settingsBox.getString(_themeStateKey);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _settingsBox.putString(_themeStateKey, state.name);
  }

  bool? getUseDynamicColors() {
    return _settingsBox.getBool(_useDynamicColorsKey);
  }

  Future<void> setUseDynamicColors(bool value) {
    return _settingsBox.putBool(_useDynamicColorsKey, value);
  }

  bool? getHarmonizeColors() {
    return _settingsBox.getBool(_harmonizeColorsKey);
  }

  Future<void> setHarmonizeColors(bool value) {
    return _settingsBox.putBool(_harmonizeColorsKey, value);
  }
}
