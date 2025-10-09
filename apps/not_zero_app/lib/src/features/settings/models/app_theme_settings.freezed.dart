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


/// Adds pattern-matching-related methods to [AppThemeSettings].
extension AppThemeSettingsPatterns on AppThemeSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppThemeSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppThemeSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppThemeSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppThemeSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppThemeSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppThemeSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeState themeState,  bool useDynamicColors,  bool harmonizeColors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppThemeSettings() when $default != null:
return $default(_that.themeState,_that.useDynamicColors,_that.harmonizeColors);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeState themeState,  bool useDynamicColors,  bool harmonizeColors)  $default,) {final _that = this;
switch (_that) {
case _AppThemeSettings():
return $default(_that.themeState,_that.useDynamicColors,_that.harmonizeColors);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeState themeState,  bool useDynamicColors,  bool harmonizeColors)?  $default,) {final _that = this;
switch (_that) {
case _AppThemeSettings() when $default != null:
return $default(_that.themeState,_that.useDynamicColors,_that.harmonizeColors);case _:
  return null;

}
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
