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

part 'tags_colors.tailor.dart';

@TailorMixin(themeGetter: .onThemeData)
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
