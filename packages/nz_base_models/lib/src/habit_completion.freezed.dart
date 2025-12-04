// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_completion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitCompletion {

 String get id; String get habitId; HabitCompletionType get type; DateTime get completedDate; int get streakCount;
/// Create a copy of HabitCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCompletionCopyWith<HabitCompletion> get copyWith => _$HabitCompletionCopyWithImpl<HabitCompletion>(this as HabitCompletion, _$identity);

  /// Serializes this HabitCompletion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitCompletion&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.type, type) || other.type == type)&&(identical(other.completedDate, completedDate) || other.completedDate == completedDate)&&(identical(other.streakCount, streakCount) || other.streakCount == streakCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,type,completedDate,streakCount);

@override
String toString() {
  return 'HabitCompletion(id: $id, habitId: $habitId, type: $type, completedDate: $completedDate, streakCount: $streakCount)';
}


}

/// @nodoc
abstract mixin class $HabitCompletionCopyWith<$Res>  {
  factory $HabitCompletionCopyWith(HabitCompletion value, $Res Function(HabitCompletion) _then) = _$HabitCompletionCopyWithImpl;
@useResult
$Res call({
 String id, String habitId, HabitCompletionType type, DateTime completedDate, int streakCount
});




}
/// @nodoc
class _$HabitCompletionCopyWithImpl<$Res>
    implements $HabitCompletionCopyWith<$Res> {
  _$HabitCompletionCopyWithImpl(this._self, this._then);

  final HabitCompletion _self;
  final $Res Function(HabitCompletion) _then;

/// Create a copy of HabitCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? type = null,Object? completedDate = null,Object? streakCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HabitCompletionType,completedDate: null == completedDate ? _self.completedDate : completedDate // ignore: cast_nullable_to_non_nullable
as DateTime,streakCount: null == streakCount ? _self.streakCount : streakCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitCompletion].
extension HabitCompletionPatterns on HabitCompletion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitCompletion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitCompletion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitCompletion value)  $default,){
final _that = this;
switch (_that) {
case _HabitCompletion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitCompletion value)?  $default,){
final _that = this;
switch (_that) {
case _HabitCompletion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String habitId,  HabitCompletionType type,  DateTime completedDate,  int streakCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitCompletion() when $default != null:
return $default(_that.id,_that.habitId,_that.type,_that.completedDate,_that.streakCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String habitId,  HabitCompletionType type,  DateTime completedDate,  int streakCount)  $default,) {final _that = this;
switch (_that) {
case _HabitCompletion():
return $default(_that.id,_that.habitId,_that.type,_that.completedDate,_that.streakCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String habitId,  HabitCompletionType type,  DateTime completedDate,  int streakCount)?  $default,) {final _that = this;
switch (_that) {
case _HabitCompletion() when $default != null:
return $default(_that.id,_that.habitId,_that.type,_that.completedDate,_that.streakCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HabitCompletion implements HabitCompletion {
  const _HabitCompletion({required this.id, required this.habitId, required this.type, required this.completedDate, this.streakCount = 1});
  factory _HabitCompletion.fromJson(Map<String, dynamic> json) => _$HabitCompletionFromJson(json);

@override final  String id;
@override final  String habitId;
@override final  HabitCompletionType type;
@override final  DateTime completedDate;
@override@JsonKey() final  int streakCount;

/// Create a copy of HabitCompletion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCompletionCopyWith<_HabitCompletion> get copyWith => __$HabitCompletionCopyWithImpl<_HabitCompletion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitCompletionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitCompletion&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.type, type) || other.type == type)&&(identical(other.completedDate, completedDate) || other.completedDate == completedDate)&&(identical(other.streakCount, streakCount) || other.streakCount == streakCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,type,completedDate,streakCount);

@override
String toString() {
  return 'HabitCompletion(id: $id, habitId: $habitId, type: $type, completedDate: $completedDate, streakCount: $streakCount)';
}


}

/// @nodoc
abstract mixin class _$HabitCompletionCopyWith<$Res> implements $HabitCompletionCopyWith<$Res> {
  factory _$HabitCompletionCopyWith(_HabitCompletion value, $Res Function(_HabitCompletion) _then) = __$HabitCompletionCopyWithImpl;
@override @useResult
$Res call({
 String id, String habitId, HabitCompletionType type, DateTime completedDate, int streakCount
});




}
/// @nodoc
class __$HabitCompletionCopyWithImpl<$Res>
    implements _$HabitCompletionCopyWith<$Res> {
  __$HabitCompletionCopyWithImpl(this._self, this._then);

  final _HabitCompletion _self;
  final $Res Function(_HabitCompletion) _then;

/// Create a copy of HabitCompletion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? type = null,Object? completedDate = null,Object? streakCount = null,}) {
  return _then(_HabitCompletion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HabitCompletionType,completedDate: null == completedDate ? _self.completedDate : completedDate // ignore: cast_nullable_to_non_nullable
as DateTime,streakCount: null == streakCount ? _self.streakCount : streakCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
