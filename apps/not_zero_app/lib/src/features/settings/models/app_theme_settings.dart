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

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';

part 'app_theme_settings.freezed.dart';

@freezed
abstract class AppThemeSettings with _$AppThemeSettings {
  const factory AppThemeSettings({
    @Default(ThemeState.system) ThemeState themeState,
    @Default(true) bool useDynamicColors,
    @Default(true) bool harmonizeColors,
  }) = _AppThemeSettings;
}
