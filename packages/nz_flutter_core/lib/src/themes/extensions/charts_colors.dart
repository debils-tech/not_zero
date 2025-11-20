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
