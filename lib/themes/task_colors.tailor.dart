// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'task_colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class TaskColorsScheme extends ThemeExtension<TaskColorsScheme> {
  const TaskColorsScheme({
    required this.notImportantColor,
    required this.normalColor,
    required this.importantColor,
  });

  final Color notImportantColor;
  final Color normalColor;
  final Color importantColor;

  static final TaskColorsScheme light = TaskColorsScheme(
    notImportantColor: _$TaskColorsScheme.notImportantColor[0],
    normalColor: _$TaskColorsScheme.normalColor[0],
    importantColor: _$TaskColorsScheme.importantColor[0],
  );

  static final TaskColorsScheme dark = TaskColorsScheme(
    notImportantColor: _$TaskColorsScheme.notImportantColor[1],
    normalColor: _$TaskColorsScheme.normalColor[1],
    importantColor: _$TaskColorsScheme.importantColor[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  TaskColorsScheme copyWith({
    Color? notImportantColor,
    Color? normalColor,
    Color? importantColor,
  }) {
    return TaskColorsScheme(
      notImportantColor: notImportantColor ?? this.notImportantColor,
      normalColor: normalColor ?? this.normalColor,
      importantColor: importantColor ?? this.importantColor,
    );
  }

  @override
  TaskColorsScheme lerp(ThemeExtension<TaskColorsScheme>? other, double t) {
    if (other is! TaskColorsScheme) return this;
    return TaskColorsScheme(
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
            other is TaskColorsScheme &&
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
        runtimeType,
        const DeepCollectionEquality().hash(notImportantColor),
        const DeepCollectionEquality().hash(normalColor),
        const DeepCollectionEquality().hash(importantColor));
  }
}

extension TaskColorsSchemeThemeData on ThemeData {
  TaskColorsScheme get taskColorsScheme => extension<TaskColorsScheme>()!;
}
