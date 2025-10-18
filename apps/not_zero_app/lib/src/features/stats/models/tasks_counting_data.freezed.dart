// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_counting_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksCountingData {

 int get notImportant; int get normal; int get important; int get created;
/// Create a copy of TasksCountingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksCountingDataCopyWith<TasksCountingData> get copyWith => _$TasksCountingDataCopyWithImpl<TasksCountingData>(this as TasksCountingData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksCountingData&&(identical(other.notImportant, notImportant) || other.notImportant == notImportant)&&(identical(other.normal, normal) || other.normal == normal)&&(identical(other.important, important) || other.important == important)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,notImportant,normal,important,created);

@override
String toString() {
  return 'TasksCountingData(notImportant: $notImportant, normal: $normal, important: $important, created: $created)';
}


}

/// @nodoc
abstract mixin class $TasksCountingDataCopyWith<$Res>  {
  factory $TasksCountingDataCopyWith(TasksCountingData value, $Res Function(TasksCountingData) _then) = _$TasksCountingDataCopyWithImpl;
@useResult
$Res call({
 int notImportant, int normal, int important, int created
});




}
/// @nodoc
class _$TasksCountingDataCopyWithImpl<$Res>
    implements $TasksCountingDataCopyWith<$Res> {
  _$TasksCountingDataCopyWithImpl(this._self, this._then);

  final TasksCountingData _self;
  final $Res Function(TasksCountingData) _then;

/// Create a copy of TasksCountingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notImportant = null,Object? normal = null,Object? important = null,Object? created = null,}) {
  return _then(_self.copyWith(
notImportant: null == notImportant ? _self.notImportant : notImportant // ignore: cast_nullable_to_non_nullable
as int,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as int,important: null == important ? _self.important : important // ignore: cast_nullable_to_non_nullable
as int,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksCountingData].
extension TasksCountingDataPatterns on TasksCountingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksCountingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksCountingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksCountingData value)  $default,){
final _that = this;
switch (_that) {
case _TasksCountingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksCountingData value)?  $default,){
final _that = this;
switch (_that) {
case _TasksCountingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int notImportant,  int normal,  int important,  int created)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksCountingData() when $default != null:
return $default(_that.notImportant,_that.normal,_that.important,_that.created);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int notImportant,  int normal,  int important,  int created)  $default,) {final _that = this;
switch (_that) {
case _TasksCountingData():
return $default(_that.notImportant,_that.normal,_that.important,_that.created);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int notImportant,  int normal,  int important,  int created)?  $default,) {final _that = this;
switch (_that) {
case _TasksCountingData() when $default != null:
return $default(_that.notImportant,_that.normal,_that.important,_that.created);case _:
  return null;

}
}

}

/// @nodoc


class _TasksCountingData implements TasksCountingData {
  const _TasksCountingData({required this.notImportant, required this.normal, required this.important, required this.created});
  

@override final  int notImportant;
@override final  int normal;
@override final  int important;
@override final  int created;

/// Create a copy of TasksCountingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksCountingDataCopyWith<_TasksCountingData> get copyWith => __$TasksCountingDataCopyWithImpl<_TasksCountingData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksCountingData&&(identical(other.notImportant, notImportant) || other.notImportant == notImportant)&&(identical(other.normal, normal) || other.normal == normal)&&(identical(other.important, important) || other.important == important)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,notImportant,normal,important,created);

@override
String toString() {
  return 'TasksCountingData(notImportant: $notImportant, normal: $normal, important: $important, created: $created)';
}


}

/// @nodoc
abstract mixin class _$TasksCountingDataCopyWith<$Res> implements $TasksCountingDataCopyWith<$Res> {
  factory _$TasksCountingDataCopyWith(_TasksCountingData value, $Res Function(_TasksCountingData) _then) = __$TasksCountingDataCopyWithImpl;
@override @useResult
$Res call({
 int notImportant, int normal, int important, int created
});




}
/// @nodoc
class __$TasksCountingDataCopyWithImpl<$Res>
    implements _$TasksCountingDataCopyWith<$Res> {
  __$TasksCountingDataCopyWithImpl(this._self, this._then);

  final _TasksCountingData _self;
  final $Res Function(_TasksCountingData) _then;

/// Create a copy of TasksCountingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notImportant = null,Object? normal = null,Object? important = null,Object? created = null,}) {
  return _then(_TasksCountingData(
notImportant: null == notImportant ? _self.notImportant : notImportant // ignore: cast_nullable_to_non_nullable
as int,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as int,important: null == important ? _self.important : important // ignore: cast_nullable_to_non_nullable
as int,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
