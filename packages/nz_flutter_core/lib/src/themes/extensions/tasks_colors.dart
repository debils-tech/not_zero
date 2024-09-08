import 'package:flutter/material.dart';
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

  @override
  final Color notImportantColor;

  @override
  final Color normalColor;

  @override
  final Color importantColor;
}
