// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'backup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BackupModel {

 Map<String, dynamic> get data; int get version;@JsonKey(name: 'app_info') AppInfo? get appInfo;
/// Create a copy of BackupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupModelCopyWith<BackupModel> get copyWith => _$BackupModelCopyWithImpl<BackupModel>(this as BackupModel, _$identity);

  /// Serializes this BackupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupModel&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.version, version) || other.version == version)&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),version,appInfo);

@override
String toString() {
  return 'BackupModel(data: $data, version: $version, appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class $BackupModelCopyWith<$Res>  {
  factory $BackupModelCopyWith(BackupModel value, $Res Function(BackupModel) _then) = _$BackupModelCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> data, int version,@JsonKey(name: 'app_info') AppInfo? appInfo
});


$AppInfoCopyWith<$Res>? get appInfo;

}
/// @nodoc
class _$BackupModelCopyWithImpl<$Res>
    implements $BackupModelCopyWith<$Res> {
  _$BackupModelCopyWithImpl(this._self, this._then);

  final BackupModel _self;
  final $Res Function(BackupModel) _then;

/// Create a copy of BackupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? version = null,Object? appInfo = freezed,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,appInfo: freezed == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppInfo?,
  ));
}
/// Create a copy of BackupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res>? get appInfo {
    if (_self.appInfo == null) {
    return null;
  }

  return $AppInfoCopyWith<$Res>(_self.appInfo!, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [BackupModel].
extension BackupModelPatterns on BackupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupModel value)  $default,){
final _that = this;
switch (_that) {
case _BackupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupModel value)?  $default,){
final _that = this;
switch (_that) {
case _BackupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> data,  int version, @JsonKey(name: 'app_info')  AppInfo? appInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupModel() when $default != null:
return $default(_that.data,_that.version,_that.appInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> data,  int version, @JsonKey(name: 'app_info')  AppInfo? appInfo)  $default,) {final _that = this;
switch (_that) {
case _BackupModel():
return $default(_that.data,_that.version,_that.appInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> data,  int version, @JsonKey(name: 'app_info')  AppInfo? appInfo)?  $default,) {final _that = this;
switch (_that) {
case _BackupModel() when $default != null:
return $default(_that.data,_that.version,_that.appInfo);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _BackupModel implements BackupModel {
   _BackupModel({required final  Map<String, dynamic> data, this.version = 1, @JsonKey(name: 'app_info') this.appInfo}): _data = data;
  factory _BackupModel.fromJson(Map<String, dynamic> json) => _$BackupModelFromJson(json);

 final  Map<String, dynamic> _data;
@override Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

@override@JsonKey() final  int version;
@override@JsonKey(name: 'app_info') final  AppInfo? appInfo;

/// Create a copy of BackupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupModelCopyWith<_BackupModel> get copyWith => __$BackupModelCopyWithImpl<_BackupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupModel&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.version, version) || other.version == version)&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),version,appInfo);

@override
String toString() {
  return 'BackupModel(data: $data, version: $version, appInfo: $appInfo)';
}


}

/// @nodoc
abstract mixin class _$BackupModelCopyWith<$Res> implements $BackupModelCopyWith<$Res> {
  factory _$BackupModelCopyWith(_BackupModel value, $Res Function(_BackupModel) _then) = __$BackupModelCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> data, int version,@JsonKey(name: 'app_info') AppInfo? appInfo
});


@override $AppInfoCopyWith<$Res>? get appInfo;

}
/// @nodoc
class __$BackupModelCopyWithImpl<$Res>
    implements _$BackupModelCopyWith<$Res> {
  __$BackupModelCopyWithImpl(this._self, this._then);

  final _BackupModel _self;
  final $Res Function(_BackupModel) _then;

/// Create a copy of BackupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? version = null,Object? appInfo = freezed,}) {
  return _then(_BackupModel(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,appInfo: freezed == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppInfo?,
  ));
}

/// Create a copy of BackupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res>? get appInfo {
    if (_self.appInfo == null) {
    return null;
  }

  return $AppInfoCopyWith<$Res>(_self.appInfo!, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}

// dart format on
