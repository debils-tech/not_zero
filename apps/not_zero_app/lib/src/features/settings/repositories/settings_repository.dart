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
import 'package:not_zero_app/src/features/settings/models/app_theme_settings.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:not_zero_app/src/features/settings/services/settings_local_service.dart';
import 'package:nz_common/nz_common.dart';

class SettingsRepository implements BaseRepository {
  const SettingsRepository(this._settingsLocalService);

  final SettingsLocalService _settingsLocalService;

  static final _log = Logger('SettingsRepository');

  AppThemeSettings loadThemeSettings() {
    _log.fine('Loading theme settings');
    return AppThemeSettings(
      themeState: _settingsLocalService.getThemeState() ?? ThemeState.system,
      useDynamicColors: _settingsLocalService.getUseDynamicColors() ?? true,
      harmonizeColors: _settingsLocalService.getHarmonizeColors() ?? true,
    );
  }

  Future<void> saveThemeSettings(AppThemeSettings settings) async {
    _log.fine('Saving theme settings: $settings');
    await _settingsLocalService.setThemeState(settings.themeState);
    await _settingsLocalService.setUseDynamicColors(settings.useDynamicColors);
    await _settingsLocalService.setHarmonizeColors(settings.harmonizeColors);
  }
}
