import 'package:flutter/material.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'task_colors.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onThemeData)
class _$TaskColorsScheme {
  static final List<Color> notImportantColor = [
    Colors.blueGrey.shade400,
    Colors.grey[350]!
  ];
  static final List<Color> normalColor = [
    Colors.amber,
    Colors.amberAccent,
  ];
  static final List<Color> importantColor = [Colors.red, Colors.redAccent];
}

extension TaskColorsMethodExtension on TaskColorsScheme {
  Color colorByImportance(TaskImportance importance) {
    switch (importance) {
      case TaskImportance.notImportant:
        return notImportantColor;
      case TaskImportance.normal:
        return normalColor;
      case TaskImportance.important:
        return importantColor;
    }
  }
}
