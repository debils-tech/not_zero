// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_theme_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppThemeSettings {

 ThemeState get themeState; bool get useDynamicColors; bool get harmonizeColors;
/// Create a copy of AppThemeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppThemeSettingsCopyWith<AppThemeSettings> get copyWith => _$AppThemeSettingsCopyWithImpl<AppThemeSettings>(this as AppThemeSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppThemeSettings&&(identical(other.themeState, themeState) || other.themeState == themeState)&&(identical(other.useDynamicColors, useDynamicColors) || other.useDynamicColors == useDynamicColors)&&(identical(other.harmonizeColors, harmonizeColors) || other.harmonizeColors == harmonizeColors));
}


@override
int get hashCode => Object.hash(runtimeType,themeState,useDynamicColors,harmonizeColors);

@override
String toString() {
  return 'AppThemeSettings(themeState: $themeState, useDynamicColors: $useDynamicColors, harmonizeColors: $harmonizeColors)';
}


}

/// @nodoc
abstract mixin class $AppThemeSettingsCopyWith<$Res>  {
  factory $AppThemeSettingsCopyWith(AppThemeSettings value, $Res Function(AppThemeSettings) _then) = _$AppThemeSettingsCopyWithImpl;
@useResult
$Res call({
 ThemeState themeState, bool useDynamicColors, bool harmonizeColors
});




}
/// @nodoc
class _$AppThemeSettingsCopyWithImpl<$Res>
    implements $AppThemeSettingsCopyWith<$Res> {
  _$AppThemeSettingsCopyWithImpl(this._self, this._then);

  final AppThemeSettings _self;
  final $Res Function(AppThemeSettings) _then;

/// Create a copy of AppThemeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeState = null,Object? useDynamicColors = null,Object? harmonizeColors = null,}) {
  return _then(_self.copyWith(
themeState: null == themeState ? _self.themeState : themeState // ignore: cast_nullable_to_non_nullable
as ThemeState,useDynamicColors: null == useDynamicColors ? _self.useDynamicColors : useDynamicColors // ignore: cast_nullable_to_non_nullable
as bool,harmonizeColors: null == harmonizeColors ? _self.harmonizeColors : harmonizeColors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}



/// @nodoc


class _AppThemeSettings implements AppThemeSettings {
  const _AppThemeSettings({this.themeState = ThemeState.system, this.useDynamicColors = true, this.harmonizeColors = true});
  

@override@JsonKey() final  ThemeState themeState;
@override@JsonKey() final  bool useDynamicColors;
@override@JsonKey() final  bool harmonizeColors;

/// Create a copy of AppThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppThemeSettingsCopyWith<_AppThemeSettings> get copyWith => __$AppThemeSettingsCopyWithImpl<_AppThemeSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppThemeSettings&&(identical(other.themeState, themeState) || other.themeState == themeState)&&(identical(other.useDynamicColors, useDynamicColors) || other.useDynamicColors == useDynamicColors)&&(identical(other.harmonizeColors, harmonizeColors) || other.harmonizeColors == harmonizeColors));
}


@override
int get hashCode => Object.hash(runtimeType,themeState,useDynamicColors,harmonizeColors);

@override
String toString() {
  return 'AppThemeSettings(themeState: $themeState, useDynamicColors: $useDynamicColors, harmonizeColors: $harmonizeColors)';
}


}

/// @nodoc
abstract mixin class _$AppThemeSettingsCopyWith<$Res> implements $AppThemeSettingsCopyWith<$Res> {
  factory _$AppThemeSettingsCopyWith(_AppThemeSettings value, $Res Function(_AppThemeSettings) _then) = __$AppThemeSettingsCopyWithImpl;
@override @useResult
$Res call({
 ThemeState themeState, bool useDynamicColors, bool harmonizeColors
});




}
/// @nodoc
class __$AppThemeSettingsCopyWithImpl<$Res>
    implements _$AppThemeSettingsCopyWith<$Res> {
  __$AppThemeSettingsCopyWithImpl(this._self, this._then);

  final _AppThemeSettings _self;
  final $Res Function(_AppThemeSettings) _then;

/// Create a copy of AppThemeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeState = null,Object? useDynamicColors = null,Object? harmonizeColors = null,}) {
  return _then(_AppThemeSettings(
themeState: null == themeState ? _self.themeState : themeState // ignore: cast_nullable_to_non_nullable
as ThemeState,useDynamicColors: null == useDynamicColors ? _self.useDynamicColors : useDynamicColors // ignore: cast_nullable_to_non_nullable
as bool,harmonizeColors: null == harmonizeColors ? _self.harmonizeColors : harmonizeColors // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
