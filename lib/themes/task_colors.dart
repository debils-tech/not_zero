import 'package:flutter/material.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'task_colors.tailor.dart';

@Tailor(themeGetter: ThemeGetter.onThemeData)
class _$TasksColorScheme {
  static final List<Color> notImportantColor = [
    Colors.blueGrey.shade400,
    Colors.grey[350]!
  ];
  static const List<Color> normalColor = [
    Colors.amber,
    Colors.amberAccent,
  ];
  static const List<Color> importantColor = [
    Colors.red,
    Colors.redAccent,
  ];
}

extension TaskColorsMethodExtension on TasksColorScheme {
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
