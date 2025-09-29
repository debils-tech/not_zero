// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'charts_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ChartsColorSchemeTailorMixin on ThemeExtension<ChartsColorScheme> {
  Color get chartBackgroundColor;
  Color get gridColor;
  Color get borderColor;
  Color get tooltipBackgroundColor;
  Color get weeklyStatsLine;
  LinearGradient get weeklyStatsBelowGradient;

  @override
  ChartsColorScheme copyWith({
    Color? chartBackgroundColor,
    Color? gridColor,
    Color? borderColor,
    Color? tooltipBackgroundColor,
    Color? weeklyStatsLine,
    LinearGradient? weeklyStatsBelowGradient,
  }) {
    return ChartsColorScheme(
      chartBackgroundColor: chartBackgroundColor ?? this.chartBackgroundColor,
      gridColor: gridColor ?? this.gridColor,
      borderColor: borderColor ?? this.borderColor,
      tooltipBackgroundColor:
          tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      weeklyStatsLine: weeklyStatsLine ?? this.weeklyStatsLine,
      weeklyStatsBelowGradient:
          weeklyStatsBelowGradient ?? this.weeklyStatsBelowGradient,
    );
  }

  @override
  ChartsColorScheme lerp(
    covariant ThemeExtension<ChartsColorScheme>? other,
    double t,
  ) {
    if (other is! ChartsColorScheme) return this as ChartsColorScheme;
    return ChartsColorScheme(
      chartBackgroundColor: Color.lerp(
        chartBackgroundColor,
        other.chartBackgroundColor,
        t,
      )!,
      gridColor: Color.lerp(gridColor, other.gridColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      tooltipBackgroundColor: Color.lerp(
        tooltipBackgroundColor,
        other.tooltipBackgroundColor,
        t,
      )!,
      weeklyStatsLine: Color.lerp(weeklyStatsLine, other.weeklyStatsLine, t)!,
      weeklyStatsBelowGradient: t < 0.5
          ? weeklyStatsBelowGradient
          : other.weeklyStatsBelowGradient,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChartsColorScheme &&
            const DeepCollectionEquality().equals(
              chartBackgroundColor,
              other.chartBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(gridColor, other.gridColor) &&
            const DeepCollectionEquality().equals(
              borderColor,
              other.borderColor,
            ) &&
            const DeepCollectionEquality().equals(
              tooltipBackgroundColor,
              other.tooltipBackgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              weeklyStatsLine,
              other.weeklyStatsLine,
            ) &&
            const DeepCollectionEquality().equals(
              weeklyStatsBelowGradient,
              other.weeklyStatsBelowGradient,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(chartBackgroundColor),
      const DeepCollectionEquality().hash(gridColor),
      const DeepCollectionEquality().hash(borderColor),
      const DeepCollectionEquality().hash(tooltipBackgroundColor),
      const DeepCollectionEquality().hash(weeklyStatsLine),
      const DeepCollectionEquality().hash(weeklyStatsBelowGradient),
    );
  }
}

extension ChartsColorSchemeThemeData on ThemeData {
  ChartsColorScheme get chartsColorScheme => extension<ChartsColorScheme>()!;
}
