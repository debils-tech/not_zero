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

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:not_zero_app/src/features/themes/extensions/charts_colors.dart';
import 'package:not_zero_app/src/features/themes/extensions/tags_colors.dart';
import 'package:not_zero_app/src/features/themes/extensions/tasks_colors.dart';

extension DynamicThemeApplicationExt on ThemeData {
  ThemeData applyDynamicColors(
    ColorScheme? dynamicColorScheme, {
    bool harmonize = true,
  }) {
    if (dynamicColorScheme == null && !harmonize) {
      return this;
    }

    var resultTheme = this;

    if (dynamicColorScheme != null) {
      resultTheme = resultTheme.copyWith(colorScheme: dynamicColorScheme);
    }

    if (harmonize) {
      final primaryColor = resultTheme.colorScheme.primary;

      var tasksColorScheme = resultTheme.extension<TasksColorScheme>();
      if (tasksColorScheme != null) {
        tasksColorScheme = tasksColorScheme.copyWith(
          notImportantColor: tasksColorScheme.notImportantColor.harmonizeWith(
            primaryColor,
          ),
          normalColor: tasksColorScheme.normalColor.harmonizeWith(primaryColor),
          importantColor: tasksColorScheme.importantColor.harmonizeWith(
            primaryColor,
          ),
        );
      }

      var tagsColorScheme = resultTheme.extension<TagsColorScheme>();
      if (tagsColorScheme != null) {
        tagsColorScheme = tagsColorScheme.copyWith(
          gray: tagsColorScheme.gray.harmonizeWith(primaryColor),
          red: tagsColorScheme.red.harmonizeWith(primaryColor),
          orange: tagsColorScheme.orange.harmonizeWith(primaryColor),
          yellow: tagsColorScheme.yellow.harmonizeWith(primaryColor),
          green: tagsColorScheme.green.harmonizeWith(primaryColor),
          teal: tagsColorScheme.teal.harmonizeWith(primaryColor),
          blue: tagsColorScheme.blue.harmonizeWith(primaryColor),
          indigo: tagsColorScheme.indigo.harmonizeWith(primaryColor),
          purple: tagsColorScheme.purple.harmonizeWith(primaryColor),
          pink: tagsColorScheme.pink.harmonizeWith(primaryColor),
        );
      }

      var chartsColorScheme = resultTheme.extension<ChartsColorScheme>();
      if (chartsColorScheme != null) {
        chartsColorScheme = chartsColorScheme.copyWith(
          chartBackgroundColor: chartsColorScheme.chartBackgroundColor
              .harmonizeWith(primaryColor),
          gridColor: chartsColorScheme.gridColor.harmonizeWith(primaryColor),
          borderColor: chartsColorScheme.borderColor.harmonizeWith(
            primaryColor,
          ),
          tooltipBackgroundColor: chartsColorScheme.tooltipBackgroundColor
              .harmonizeWith(primaryColor),
          weeklyStatsLine: chartsColorScheme.weeklyStatsLine.harmonizeWith(
            primaryColor,
          ),
          weeklyStatsBelowGradient: LinearGradient(
            colors: chartsColorScheme.weeklyStatsBelowGradient.colors
                .map((color) => color.harmonizeWith(primaryColor))
                .toList(),
          ),
        );
      }

      resultTheme = resultTheme.copyWith(
        extensions: [
          ?tasksColorScheme,
          ?tagsColorScheme,
          ?chartsColorScheme,
        ],
      );
    }

    return resultTheme;
  }
}
