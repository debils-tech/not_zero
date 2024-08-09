import 'package:flutter/material.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'tasks_colors.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.onThemeData)
class TasksColorScheme extends ThemeExtension<TasksColorScheme>
    with _$TasksColorSchemeTailorMixin {
  const TasksColorScheme({
    required this.notImportantColor,
    required this.normalColor,
    required this.importantColor,
  });

  final Color notImportantColor;

  final Color normalColor;

  final Color importantColor;

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

  // static final notImportantColor = [
  //   Colors.blueGrey.shade400,
  //   Colors.grey[350]!
  // ];
  // static const normalColor = [
  //   Colors.amber,
  //   Colors.amberAccent,
  // ];
  // static const importantColor = [
  //   Colors.red,
  //   Colors.redAccent,
  // ];
}
