// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'tasks_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$TasksColorSchemeTailorMixin on ThemeExtension<TasksColorScheme> {
  Color get notImportantColor;
  Color get normalColor;
  Color get importantColor;

  @override
  TasksColorScheme copyWith({
    Color? notImportantColor,
    Color? normalColor,
    Color? importantColor,
  }) {
    return TasksColorScheme(
      notImportantColor: notImportantColor ?? this.notImportantColor,
      normalColor: normalColor ?? this.normalColor,
      importantColor: importantColor ?? this.importantColor,
    );
  }

  @override
  TasksColorScheme lerp(
      covariant ThemeExtension<TasksColorScheme>? other, double t) {
    if (other is! TasksColorScheme) return this as TasksColorScheme;
    return TasksColorScheme(
      notImportantColor:
          Color.lerp(notImportantColor, other.notImportantColor, t)!,
      normalColor: Color.lerp(normalColor, other.normalColor, t)!,
      importantColor: Color.lerp(importantColor, other.importantColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TasksColorScheme &&
            const DeepCollectionEquality()
                .equals(notImportantColor, other.notImportantColor) &&
            const DeepCollectionEquality()
                .equals(normalColor, other.normalColor) &&
            const DeepCollectionEquality()
                .equals(importantColor, other.importantColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(notImportantColor),
      const DeepCollectionEquality().hash(normalColor),
      const DeepCollectionEquality().hash(importantColor),
    );
  }
}

extension TasksColorSchemeThemeData on ThemeData {
  TasksColorScheme get tasksColorScheme => extension<TasksColorScheme>()!;
}
