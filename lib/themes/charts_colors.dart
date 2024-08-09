import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'charts_colors.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onThemeData)
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

  // static const chartBackgroundColor = [
  //   Color(0xFFF3EDFD),
  //   Color(0xFF251E2C),
  // ];

  // static const gridColor = [
  //   Colors.black12,
  //   Colors.white10,
  // ];

  // static const borderColor = [
  //   Colors.black26,
  //   Colors.white24,
  // ];

  // static const tooltipBackgroundColor = [
  //   Color(0xFF1B171E),
  //   Color(0xFF1B171E),
  // ];

  // static const weeklyStatsLine = [
  //   Color(0xFFBB86FC),
  //   Color(0xFF6200EE),
  // ];

  // static const weeklyStatsBelowGradient = [
  // LinearGradient(
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  //   colors: [
  //     Color(0x80BB86FC),
  //     Color(0x60BB86FC),
  //   ],
  // ),
  // LinearGradient(
  //   begin: Alignment.topCenter,
  //   end: Alignment.bottomCenter,
  //   colors: [
  //     Color(0x806200EE),
  //     Color(0x40BB86FC),
  //   ],
  // ),
  // ];
}
