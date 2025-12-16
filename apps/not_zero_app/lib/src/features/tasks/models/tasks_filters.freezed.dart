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

 DateTime get forDate; Set<String> get searchTags; bool get someday;// bool? completed,
 bool? get canceled;
/// Create a copy of TasksFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksFiltersCopyWith<TasksFilters> get copyWith => _$TasksFiltersCopyWithImpl<TasksFilters>(this as TasksFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksFilters&&(identical(other.forDate, forDate) || other.forDate == forDate)&&const DeepCollectionEquality().equals(other.searchTags, searchTags)&&(identical(other.someday, someday) || other.someday == someday)&&(identical(other.canceled, canceled) || other.canceled == canceled));
}


@override
int get hashCode => Object.hash(runtimeType,forDate,const DeepCollectionEquality().hash(searchTags),someday,canceled);

@override
String toString() {
  return 'TasksFilters(forDate: $forDate, searchTags: $searchTags, someday: $someday, canceled: $canceled)';
}


}

/// @nodoc
abstract mixin class $TasksFiltersCopyWith<$Res>  {
  factory $TasksFiltersCopyWith(TasksFilters value, $Res Function(TasksFilters) _then) = _$TasksFiltersCopyWithImpl;
@useResult
$Res call({
 DateTime forDate, Set<String> searchTags, bool someday, bool? canceled
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
@pragma('vm:prefer-inline') @override $Res call({Object? forDate = null,Object? searchTags = null,Object? someday = null,Object? canceled = freezed,}) {
  return _then(_self.copyWith(
forDate: null == forDate ? _self.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime,searchTags: null == searchTags ? _self.searchTags : searchTags // ignore: cast_nullable_to_non_nullable
as Set<String>,someday: null == someday ? _self.someday : someday // ignore: cast_nullable_to_non_nullable
as bool,canceled: freezed == canceled ? _self.canceled : canceled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}



/// @nodoc


class _TasksFilters implements TasksFilters {
  const _TasksFilters({required this.forDate, final  Set<String> searchTags = const <String>{}, this.someday = false, this.canceled}): _searchTags = searchTags;
  

@override final  DateTime forDate;
 final  Set<String> _searchTags;
@override@JsonKey() Set<String> get searchTags {
  if (_searchTags is EqualUnmodifiableSetView) return _searchTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_searchTags);
}

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksFilters&&(identical(other.forDate, forDate) || other.forDate == forDate)&&const DeepCollectionEquality().equals(other._searchTags, _searchTags)&&(identical(other.someday, someday) || other.someday == someday)&&(identical(other.canceled, canceled) || other.canceled == canceled));
}


@override
int get hashCode => Object.hash(runtimeType,forDate,const DeepCollectionEquality().hash(_searchTags),someday,canceled);

@override
String toString() {
  return 'TasksFilters(forDate: $forDate, searchTags: $searchTags, someday: $someday, canceled: $canceled)';
}


}

/// @nodoc
abstract mixin class _$TasksFiltersCopyWith<$Res> implements $TasksFiltersCopyWith<$Res> {
  factory _$TasksFiltersCopyWith(_TasksFilters value, $Res Function(_TasksFilters) _then) = __$TasksFiltersCopyWithImpl;
@override @useResult
$Res call({
 DateTime forDate, Set<String> searchTags, bool someday, bool? canceled
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
@override @pragma('vm:prefer-inline') $Res call({Object? forDate = null,Object? searchTags = null,Object? someday = null,Object? canceled = freezed,}) {
  return _then(_TasksFilters(
forDate: null == forDate ? _self.forDate : forDate // ignore: cast_nullable_to_non_nullable
as DateTime,searchTags: null == searchTags ? _self._searchTags : searchTags // ignore: cast_nullable_to_non_nullable
as Set<String>,someday: null == someday ? _self.someday : someday // ignore: cast_nullable_to_non_nullable
as bool,canceled: freezed == canceled ? _self.canceled : canceled // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
