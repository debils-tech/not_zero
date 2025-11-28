// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habits_counting_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitsCountingData {

 Map<UniqueHabitCombination, int> get completed; int get created;
/// Create a copy of HabitsCountingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitsCountingDataCopyWith<HabitsCountingData> get copyWith => _$HabitsCountingDataCopyWithImpl<HabitsCountingData>(this as HabitsCountingData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitsCountingData&&const DeepCollectionEquality().equals(other.completed, completed)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(completed),created);

@override
String toString() {
  return 'HabitsCountingData(completed: $completed, created: $created)';
}


}

/// @nodoc
abstract mixin class $HabitsCountingDataCopyWith<$Res>  {
  factory $HabitsCountingDataCopyWith(HabitsCountingData value, $Res Function(HabitsCountingData) _then) = _$HabitsCountingDataCopyWithImpl;
@useResult
$Res call({
 Map<UniqueHabitCombination, int> completed, int created
});




}
/// @nodoc
class _$HabitsCountingDataCopyWithImpl<$Res>
    implements $HabitsCountingDataCopyWith<$Res> {
  _$HabitsCountingDataCopyWithImpl(this._self, this._then);

  final HabitsCountingData _self;
  final $Res Function(HabitsCountingData) _then;

/// Create a copy of HabitsCountingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completed = null,Object? created = null,}) {
  return _then(_self.copyWith(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as Map<UniqueHabitCombination, int>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}



/// @nodoc


class _HabitsCountingData implements HabitsCountingData {
  const _HabitsCountingData({required final  Map<UniqueHabitCombination, int> completed, required this.created}): _completed = completed;
  

 final  Map<UniqueHabitCombination, int> _completed;
@override Map<UniqueHabitCombination, int> get completed {
  if (_completed is EqualUnmodifiableMapView) return _completed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_completed);
}

@override final  int created;

/// Create a copy of HabitsCountingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitsCountingDataCopyWith<_HabitsCountingData> get copyWith => __$HabitsCountingDataCopyWithImpl<_HabitsCountingData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitsCountingData&&const DeepCollectionEquality().equals(other._completed, _completed)&&(identical(other.created, created) || other.created == created));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_completed),created);

@override
String toString() {
  return 'HabitsCountingData(completed: $completed, created: $created)';
}


}

/// @nodoc
abstract mixin class _$HabitsCountingDataCopyWith<$Res> implements $HabitsCountingDataCopyWith<$Res> {
  factory _$HabitsCountingDataCopyWith(_HabitsCountingData value, $Res Function(_HabitsCountingData) _then) = __$HabitsCountingDataCopyWithImpl;
@override @useResult
$Res call({
 Map<UniqueHabitCombination, int> completed, int created
});




}
/// @nodoc
class __$HabitsCountingDataCopyWithImpl<$Res>
    implements _$HabitsCountingDataCopyWith<$Res> {
  __$HabitsCountingDataCopyWithImpl(this._self, this._then);

  final _HabitsCountingData _self;
  final $Res Function(_HabitsCountingData) _then;

/// Create a copy of HabitsCountingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completed = null,Object? created = null,}) {
  return _then(_HabitsCountingData(
completed: null == completed ? _self._completed : completed // ignore: cast_nullable_to_non_nullable
as Map<UniqueHabitCombination, int>,created: null == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
