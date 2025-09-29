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

  Color colorByIndex(int index) {
    final colors = allColors();

    var actualIndex = index;
    if (index < 0 || index >= colors.length) actualIndex = 0;

    return colors[actualIndex];
  }

  List<Color> allColors() => [
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
