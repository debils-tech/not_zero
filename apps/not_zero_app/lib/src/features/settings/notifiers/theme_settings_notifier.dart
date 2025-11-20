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

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/models/app_theme_settings.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';

class ThemeSettingsNotifier extends Notifier<AppThemeSettings> {
  @override
  AppThemeSettings build() {
    final settingsRepository = ref.read(settingsRepositoryProvider);
    return settingsRepository.loadThemeSettings();
  }

  void setTheme(ThemeState newState) {
    state = state.copyWith(themeState: newState);
    final settingsRepository = ref.read(settingsRepositoryProvider);
    unawaited(settingsRepository.saveThemeSettings(state));
  }

  void setUseDynamicColors(bool newUseDynamicColors) {
    state = state.copyWith(useDynamicColors: newUseDynamicColors);
    final settingsRepository = ref.read(settingsRepositoryProvider);
    unawaited(settingsRepository.saveThemeSettings(state));
  }

  void setHarmonizeColors(bool newHarmonizeColors) {
    state = state.copyWith(harmonizeColors: newHarmonizeColors);
    final settingsRepository = ref.read(settingsRepositoryProvider);
    unawaited(settingsRepository.saveThemeSettings(state));
  }
}
