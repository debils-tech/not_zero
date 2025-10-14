// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksFilters {

 Set<String> get searchTags; DateTime? get forDate; bool get someday;// bool? completed,
 bool? get canceled;
/// Create a copy of TasksFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksFiltersCopyWith<TasksFilters> get copyWith => _$TasksFiltersCopyWithImpl<TasksFilters>(this as TasksFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksFilters&&const DeepCollectionEquality().equals(other.searchTags, searchTags)&&(identical(other.forDate, forDate) || other.forDate == forDate)&&(identical(other.someday, someday) || other.someday == someday)&&(identical(other.canceled, canceled) || other.canceled == canceled));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(searchTags),forDate,someday,canceled);

@override
String toString() {
  return 'TasksFilters(searchTags: $searchTags, forDate: $forDate, someday: $someday, canceled: $canceled)';
}


}

/// @nodoc
abstract mixin class $TasksFiltersCopyWith<$Res>  {
  factory $TasksFiltersCopyWith(TasksFilters value, $Res Function(TasksFilters) _then) = _$TasksFiltersCopyWithImpl;
@useResult
$Res call({
 Set<String> searchTags, DateTime? forDate, bool someday, bool? canceled
});




}
/// @nodoc
class _$TasksFiltersCopyWithImpl<$Res>
    implements $TasksFiltersCopyWith<$Res> {
  _$TasksFiltersCopyWithImpl(this._self, this._then);

  final TasksFilters _self;
  final $Res Function(TasksFilters) _then;

/// Create a copy of TasksFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchTags = null,Object? forDate = freezed,Object? someday = null,Object? canceled = freezed,}) {
  return _then(_self.copyWith(
searchTags: null == searchTags ? _self.searchTags : searchTags // ignore: cast_nullable_to_non_nullable
as Set<String>,forDate: freezed == forDate ? _self.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime?,someday: null == someday ? _self.someday : someday // ignore: cast_nullable_to_non_nullable
as bool,canceled: freezed == canceled ? _self.canceled : canceled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksFilters].
extension TasksFiltersPatterns on TasksFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksFilters value)  $default,){
final _that = this;
switch (_that) {
case _TasksFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksFilters value)?  $default,){
final _that = this;
switch (_that) {
case _TasksFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<String> searchTags,  DateTime? forDate,  bool someday,  bool? canceled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksFilters() when $default != null:
return $default(_that.searchTags,_that.forDate,_that.someday,_that.canceled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<String> searchTags,  DateTime? forDate,  bool someday,  bool? canceled)  $default,) {final _that = this;
switch (_that) {
case _TasksFilters():
return $default(_that.searchTags,_that.forDate,_that.someday,_that.canceled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<String> searchTags,  DateTime? forDate,  bool someday,  bool? canceled)?  $default,) {final _that = this;
switch (_that) {
case _TasksFilters() when $default != null:
return $default(_that.searchTags,_that.forDate,_that.someday,_that.canceled);case _:
  return null;

}
}

}

/// @nodoc


class _TasksFilters extends TasksFilters {
  const _TasksFilters({final  Set<String> searchTags = const <String>{}, this.forDate, this.someday = false, this.canceled}): _searchTags = searchTags,super._();
  

 final  Set<String> _searchTags;
@override@JsonKey() Set<String> get searchTags {
  if (_searchTags is EqualUnmodifiableSetView) return _searchTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_searchTags);
}

@override final  DateTime? forDate;
@override@JsonKey() final  bool someday;
// bool? completed,
@override final  bool? canceled;

/// Create a copy of TasksFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksFiltersCopyWith<_TasksFilters> get copyWith => __$TasksFiltersCopyWithImpl<_TasksFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksFilters&&const DeepCollectionEquality().equals(other._searchTags, _searchTags)&&(identical(other.forDate, forDate) || other.forDate == forDate)&&(identical(other.someday, someday) || other.someday == someday)&&(identical(other.canceled, canceled) || other.canceled == canceled));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_searchTags),forDate,someday,canceled);

@override
String toString() {
  return 'TasksFilters(searchTags: $searchTags, forDate: $forDate, someday: $someday, canceled: $canceled)';
}


}

/// @nodoc
abstract mixin class _$TasksFiltersCopyWith<$Res> implements $TasksFiltersCopyWith<$Res> {
  factory _$TasksFiltersCopyWith(_TasksFilters value, $Res Function(_TasksFilters) _then) = __$TasksFiltersCopyWithImpl;
@override @useResult
$Res call({
 Set<String> searchTags, DateTime? forDate, bool someday, bool? canceled
});




}
/// @nodoc
class __$TasksFiltersCopyWithImpl<$Res>
    implements _$TasksFiltersCopyWith<$Res> {
  __$TasksFiltersCopyWithImpl(this._self, this._then);

  final _TasksFilters _self;
  final $Res Function(_TasksFilters) _then;

/// Create a copy of TasksFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchTags = null,Object? forDate = freezed,Object? someday = null,Object? canceled = freezed,}) {
  return _then(_TasksFilters(
searchTags: null == searchTags ? _self._searchTags : searchTags // ignore: cast_nullable_to_non_nullable
as Set<String>,forDate: freezed == forDate ? _self.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime?,someday: null == someday ? _self.someday : someday // ignore: cast_nullable_to_non_nullable
as bool,canceled: freezed == canceled ? _self.canceled : canceled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
