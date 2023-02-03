import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'charts_colors.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onThemeData)
class _$ChartsColorScheme {
  static const List<Color> gridColor = [
    Colors.black12,
    Colors.white10,
  ];

  static const List<Color> borderColor = [
    Colors.black26,
    Colors.white24,
  ];

  static const List<Color> weeklyStatsLine = [
    Color(0xFFBB86FC),
    Color(0xFF6200EE),
  ];

  static const List<Gradient> weeklyStatsBelowGradient = [
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0x80BB86FC),
        Color(0x60BB86FC),
      ],
    ),
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0x806200EE),
        Color(0x40BB86FC),
      ],
    ),
  ];
}
