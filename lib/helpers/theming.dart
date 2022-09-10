import 'package:flutter/material.dart';

@immutable
class TaskColors extends ThemeExtension<TaskColors> {
  const TaskColors({
    required this.notImportantColor,
    required this.normalColor,
    required this.importantColor,
  });

  final Color notImportantColor;
  final Color normalColor;
  final Color importantColor;

  @override
  ThemeExtension<TaskColors> lerp(ThemeExtension<TaskColors>? other, double t) {
    if (other is! TaskColors) {
      return this;
    }
    
    return TaskColors(
      notImportantColor: Color.lerp(
        notImportantColor,
        other.notImportantColor,
        t,
      )!,
      normalColor: Color.lerp(
        normalColor,
        other.normalColor,
        t,
      )!,
      importantColor: Color.lerp(
        importantColor,
        other.importantColor,
        t,
      )!,
    );
  }

  @override
  ThemeExtension<TaskColors> copyWith({
    Color? notImportantColor,
    Color? normalColor,
    Color? importantColor,
  }) =>
      TaskColors(
        notImportantColor: notImportantColor ?? this.notImportantColor,
        normalColor: normalColor ?? this.normalColor,
        importantColor: importantColor ?? this.importantColor,
      );
}
