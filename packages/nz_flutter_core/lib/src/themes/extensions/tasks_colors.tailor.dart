// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    covariant ThemeExtension<TasksColorScheme>? other,
    double t,
  ) {
    if (other is! TasksColorScheme) return this as TasksColorScheme;
    return TasksColorScheme(
      notImportantColor: Color.lerp(
        notImportantColor,
        other.notImportantColor,
        t,
      )!,
      normalColor: Color.lerp(normalColor, other.normalColor, t)!,
      importantColor: Color.lerp(importantColor, other.importantColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TasksColorScheme &&
            const DeepCollectionEquality().equals(
              notImportantColor,
              other.notImportantColor,
            ) &&
            const DeepCollectionEquality().equals(
              normalColor,
              other.normalColor,
            ) &&
            const DeepCollectionEquality().equals(
              importantColor,
              other.importantColor,
            ));
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
