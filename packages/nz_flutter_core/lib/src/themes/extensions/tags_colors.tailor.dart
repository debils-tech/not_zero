// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'tags_colors.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$TagsColorSchemeTailorMixin on ThemeExtension<TagsColorScheme> {
  Color get gray;
  Color get red;
  Color get orange;
  Color get yellow;
  Color get green;
  Color get teal;
  Color get blue;
  Color get indigo;
  Color get purple;
  Color get pink;

  @override
  TagsColorScheme copyWith({
    Color? gray,
    Color? red,
    Color? orange,
    Color? yellow,
    Color? green,
    Color? teal,
    Color? blue,
    Color? indigo,
    Color? purple,
    Color? pink,
  }) {
    return TagsColorScheme(
      gray: gray ?? this.gray,
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      green: green ?? this.green,
      teal: teal ?? this.teal,
      blue: blue ?? this.blue,
      indigo: indigo ?? this.indigo,
      purple: purple ?? this.purple,
      pink: pink ?? this.pink,
    );
  }

  @override
  TagsColorScheme lerp(
      covariant ThemeExtension<TagsColorScheme>? other, double t) {
    if (other is! TagsColorScheme) return this as TagsColorScheme;
    return TagsColorScheme(
      gray: Color.lerp(gray, other.gray, t)!,
      red: Color.lerp(red, other.red, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      green: Color.lerp(green, other.green, t)!,
      teal: Color.lerp(teal, other.teal, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      indigo: Color.lerp(indigo, other.indigo, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TagsColorScheme &&
            const DeepCollectionEquality().equals(gray, other.gray) &&
            const DeepCollectionEquality().equals(red, other.red) &&
            const DeepCollectionEquality().equals(orange, other.orange) &&
            const DeepCollectionEquality().equals(yellow, other.yellow) &&
            const DeepCollectionEquality().equals(green, other.green) &&
            const DeepCollectionEquality().equals(teal, other.teal) &&
            const DeepCollectionEquality().equals(blue, other.blue) &&
            const DeepCollectionEquality().equals(indigo, other.indigo) &&
            const DeepCollectionEquality().equals(purple, other.purple) &&
            const DeepCollectionEquality().equals(pink, other.pink));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(gray),
      const DeepCollectionEquality().hash(red),
      const DeepCollectionEquality().hash(orange),
      const DeepCollectionEquality().hash(yellow),
      const DeepCollectionEquality().hash(green),
      const DeepCollectionEquality().hash(teal),
      const DeepCollectionEquality().hash(blue),
      const DeepCollectionEquality().hash(indigo),
      const DeepCollectionEquality().hash(purple),
      const DeepCollectionEquality().hash(pink),
    );
  }
}

extension TagsColorSchemeThemeData on ThemeData {
  TagsColorScheme get tagsColorScheme => extension<TagsColorScheme>()!;
}
