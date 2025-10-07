// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuickStatisticsState {

 List<int>? get chartStats; DateTime? get chartRangeStart; DateTime? get chartRangeEnd; int? get selectedDayIndex;
/// Create a copy of QuickStatisticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuickStatisticsStateCopyWith<QuickStatisticsState> get copyWith => _$QuickStatisticsStateCopyWithImpl<QuickStatisticsState>(this as QuickStatisticsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuickStatisticsState&&const DeepCollectionEquality().equals(other.chartStats, chartStats)&&(identical(other.chartRangeStart, chartRangeStart) || other.chartRangeStart == chartRangeStart)&&(identical(other.chartRangeEnd, chartRangeEnd) || other.chartRangeEnd == chartRangeEnd)&&(identical(other.selectedDayIndex, selectedDayIndex) || other.selectedDayIndex == selectedDayIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(chartStats),chartRangeStart,chartRangeEnd,selectedDayIndex);

@override
String toString() {
  return 'QuickStatisticsState(chartStats: $chartStats, chartRangeStart: $chartRangeStart, chartRangeEnd: $chartRangeEnd, selectedDayIndex: $selectedDayIndex)';
}


}

/// @nodoc
abstract mixin class $QuickStatisticsStateCopyWith<$Res>  {
  factory $QuickStatisticsStateCopyWith(QuickStatisticsState value, $Res Function(QuickStatisticsState) _then) = _$QuickStatisticsStateCopyWithImpl;
@useResult
$Res call({
 List<int>? chartStats, DateTime? chartRangeStart, DateTime? chartRangeEnd, int? selectedDayIndex
});




}
/// @nodoc
class _$QuickStatisticsStateCopyWithImpl<$Res>
    implements $QuickStatisticsStateCopyWith<$Res> {
  _$QuickStatisticsStateCopyWithImpl(this._self, this._then);

  final QuickStatisticsState _self;
  final $Res Function(QuickStatisticsState) _then;

/// Create a copy of QuickStatisticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chartStats = freezed,Object? chartRangeStart = freezed,Object? chartRangeEnd = freezed,Object? selectedDayIndex = freezed,}) {
  return _then(_self.copyWith(
chartStats: freezed == chartStats ? _self.chartStats : chartStats // ignore: cast_nullable_to_non_nullable
as List<int>?,chartRangeStart: freezed == chartRangeStart ? _self.chartRangeStart : chartRangeStart // ignore: cast_nullable_to_non_nullable
as DateTime?,chartRangeEnd: freezed == chartRangeEnd ? _self.chartRangeEnd : chartRangeEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedDayIndex: freezed == selectedDayIndex ? _self.selectedDayIndex : selectedDayIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuickStatisticsState].
extension QuickStatisticsStatePatterns on QuickStatisticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuickStatisticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuickStatisticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuickStatisticsState value)  $default,){
final _that = this;
switch (_that) {
case _QuickStatisticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuickStatisticsState value)?  $default,){
final _that = this;
switch (_that) {
case _QuickStatisticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int>? chartStats,  DateTime? chartRangeStart,  DateTime? chartRangeEnd,  int? selectedDayIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuickStatisticsState() when $default != null:
return $default(_that.chartStats,_that.chartRangeStart,_that.chartRangeEnd,_that.selectedDayIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int>? chartStats,  DateTime? chartRangeStart,  DateTime? chartRangeEnd,  int? selectedDayIndex)  $default,) {final _that = this;
switch (_that) {
case _QuickStatisticsState():
return $default(_that.chartStats,_that.chartRangeStart,_that.chartRangeEnd,_that.selectedDayIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int>? chartStats,  DateTime? chartRangeStart,  DateTime? chartRangeEnd,  int? selectedDayIndex)?  $default,) {final _that = this;
switch (_that) {
case _QuickStatisticsState() when $default != null:
return $default(_that.chartStats,_that.chartRangeStart,_that.chartRangeEnd,_that.selectedDayIndex);case _:
  return null;

}
}

}

/// @nodoc


class _QuickStatisticsState extends QuickStatisticsState {
  const _QuickStatisticsState({final  List<int>? chartStats, this.chartRangeStart, this.chartRangeEnd, this.selectedDayIndex}): _chartStats = chartStats,super._();
  

 final  List<int>? _chartStats;
@override List<int>? get chartStats {
  final value = _chartStats;
  if (value == null) return null;
  if (_chartStats is EqualUnmodifiableListView) return _chartStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? chartRangeStart;
@override final  DateTime? chartRangeEnd;
@override final  int? selectedDayIndex;

/// Create a copy of QuickStatisticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuickStatisticsStateCopyWith<_QuickStatisticsState> get copyWith => __$QuickStatisticsStateCopyWithImpl<_QuickStatisticsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuickStatisticsState&&const DeepCollectionEquality().equals(other._chartStats, _chartStats)&&(identical(other.chartRangeStart, chartRangeStart) || other.chartRangeStart == chartRangeStart)&&(identical(other.chartRangeEnd, chartRangeEnd) || other.chartRangeEnd == chartRangeEnd)&&(identical(other.selectedDayIndex, selectedDayIndex) || other.selectedDayIndex == selectedDayIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_chartStats),chartRangeStart,chartRangeEnd,selectedDayIndex);

@override
String toString() {
  return 'QuickStatisticsState(chartStats: $chartStats, chartRangeStart: $chartRangeStart, chartRangeEnd: $chartRangeEnd, selectedDayIndex: $selectedDayIndex)';
}


}

/// @nodoc
abstract mixin class _$QuickStatisticsStateCopyWith<$Res> implements $QuickStatisticsStateCopyWith<$Res> {
  factory _$QuickStatisticsStateCopyWith(_QuickStatisticsState value, $Res Function(_QuickStatisticsState) _then) = __$QuickStatisticsStateCopyWithImpl;
@override @useResult
$Res call({
 List<int>? chartStats, DateTime? chartRangeStart, DateTime? chartRangeEnd, int? selectedDayIndex
});




}
/// @nodoc
class __$QuickStatisticsStateCopyWithImpl<$Res>
    implements _$QuickStatisticsStateCopyWith<$Res> {
  __$QuickStatisticsStateCopyWithImpl(this._self, this._then);

  final _QuickStatisticsState _self;
  final $Res Function(_QuickStatisticsState) _then;

/// Create a copy of QuickStatisticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chartStats = freezed,Object? chartRangeStart = freezed,Object? chartRangeEnd = freezed,Object? selectedDayIndex = freezed,}) {
  return _then(_QuickStatisticsState(
chartStats: freezed == chartStats ? _self._chartStats : chartStats // ignore: cast_nullable_to_non_nullable
as List<int>?,chartRangeStart: freezed == chartRangeStart ? _self.chartRangeStart : chartRangeStart // ignore: cast_nullable_to_non_nullable
as DateTime?,chartRangeEnd: freezed == chartRangeEnd ? _self.chartRangeEnd : chartRangeEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedDayIndex: freezed == selectedDayIndex ? _self.selectedDayIndex : selectedDayIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
