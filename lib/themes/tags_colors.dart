import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'tags_colors.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onThemeData)
class TagsColorScheme extends ThemeExtension<TagsColorScheme>
    with _$TagsColorSchemeTailorMixin {
  const TagsColorScheme({
    required this.gray,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.green,
    required this.teal,
    required this.blue,
    required this.indigo,
    required this.purple,
    required this.pink,
  });

  @override
  final Color gray;

  @override
  final Color red;

  @override
  final Color orange;

  @override
  final Color yellow;

  @override
  final Color green;

  @override
  final Color teal;

  @override
  final Color blue;

  @override
  final Color indigo;

  @override
  final Color purple;

  @override
  final Color pink;

  // static const gray = [
  //   Color(0xFF636366),
  //   Color(0xFFAEAEB2),
  // ];

  // static const red = [
  //   Color(0xFFFF3B30),
  //   Color(0xFFFF453A),
  // ];

  // static const orange = [
  //   Color(0xFFFF9500),
  //   Color(0xFFFF9F0A),
  // ];

  // static const yellow = [
  //   Color(0xFFFFCC00),
  //   Color(0xFFFFD60A),
  // ];

  // static const green = [
  //   Color(0xFF34C759),
  //   Color(0xFF32D74B),
  // ];

  // static const teal = [
  //   Color(0xFF5AC8FA),
  //   Color(0xFF64D2FF),
  // ];

  // static const blue = [
  //   Color(0xFF007AFF),
  //   Color(0xFF0A84FF),
  // ];

  // static const indigo = [
  //   Color(0xFF5856D6),
  //   Color(0xFF5E5CE6),
  // ];

  // static const purple = [
  //   Color(0xFFAF52DE),
  //   Color(0xFFBF5AF2),
  // ];

  // static const pink = [
  //   Color(0xFFFF2D55),
  //   Color(0xFFFF2D55),
  // ];
}

extension TagsColorsMethodExtension on TagsColorScheme {
  Color colorByIndex(int index) {
    final colors = allColors;

    var actualIndex = index;
    if (index < 0 || index >= colors.length) actualIndex = 0;

    return allColors[actualIndex];
  }

  List<Color> get allColors => [
        gray,
        red,
        orange,
        yellow,
        green,
        teal,
        blue,
        indigo,
        purple,
        pink,
      ];
}
