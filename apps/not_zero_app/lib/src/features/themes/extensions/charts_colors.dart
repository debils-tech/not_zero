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

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'charts_colors.tailor.dart';

@TailorMixin(themeGetter: .onThemeData)
class ChartsColorScheme extends ThemeExtension<ChartsColorScheme>
    with _$ChartsColorSchemeTailorMixin {
  const ChartsColorScheme({
    required this.chartBackgroundColor,
    required this.gridColor,
    required this.borderColor,
    required this.tooltipBackgroundColor,
    required this.weeklyStatsLine,
    required this.weeklyStatsBelowGradient,
  });

  @override
  final Color chartBackgroundColor;

  @override
  final Color gridColor;

  @override
  final Color borderColor;

  @override
  final Color tooltipBackgroundColor;

  @override
  final Color weeklyStatsLine;

  @override
  final LinearGradient weeklyStatsBelowGradient;
}
