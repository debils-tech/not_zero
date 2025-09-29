// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$QuickStatisticsState {
  List<int>? get chartStats => throw _privateConstructorUsedError;
  DateTime? get chartRangeStart => throw _privateConstructorUsedError;
  DateTime? get chartRangeEnd => throw _privateConstructorUsedError;
  int? get selectedDayIndex => throw _privateConstructorUsedError;

  /// Create a copy of QuickStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickStatisticsStateCopyWith<QuickStatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickStatisticsStateCopyWith<$Res> {
  factory $QuickStatisticsStateCopyWith(
    QuickStatisticsState value,
    $Res Function(QuickStatisticsState) then,
  ) = _$QuickStatisticsStateCopyWithImpl<$Res, QuickStatisticsState>;
  @useResult
  $Res call({
    List<int>? chartStats,
    DateTime? chartRangeStart,
    DateTime? chartRangeEnd,
    int? selectedDayIndex,
  });
}

/// @nodoc
class _$QuickStatisticsStateCopyWithImpl<
  $Res,
  $Val extends QuickStatisticsState
>
    implements $QuickStatisticsStateCopyWith<$Res> {
  _$QuickStatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartStats = freezed,
    Object? chartRangeStart = freezed,
    Object? chartRangeEnd = freezed,
    Object? selectedDayIndex = freezed,
  }) {
    return _then(
      _value.copyWith(
            chartStats: freezed == chartStats
                ? _value.chartStats
                : chartStats // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
            chartRangeStart: freezed == chartRangeStart
                ? _value.chartRangeStart
                : chartRangeStart // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            chartRangeEnd: freezed == chartRangeEnd
                ? _value.chartRangeEnd
                : chartRangeEnd // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            selectedDayIndex: freezed == selectedDayIndex
                ? _value.selectedDayIndex
                : selectedDayIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuickStatisticsStateImplCopyWith<$Res>
    implements $QuickStatisticsStateCopyWith<$Res> {
  factory _$$QuickStatisticsStateImplCopyWith(
    _$QuickStatisticsStateImpl value,
    $Res Function(_$QuickStatisticsStateImpl) then,
  ) = __$$QuickStatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int>? chartStats,
    DateTime? chartRangeStart,
    DateTime? chartRangeEnd,
    int? selectedDayIndex,
  });
}

/// @nodoc
class __$$QuickStatisticsStateImplCopyWithImpl<$Res>
    extends _$QuickStatisticsStateCopyWithImpl<$Res, _$QuickStatisticsStateImpl>
    implements _$$QuickStatisticsStateImplCopyWith<$Res> {
  __$$QuickStatisticsStateImplCopyWithImpl(
    _$QuickStatisticsStateImpl _value,
    $Res Function(_$QuickStatisticsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuickStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartStats = freezed,
    Object? chartRangeStart = freezed,
    Object? chartRangeEnd = freezed,
    Object? selectedDayIndex = freezed,
  }) {
    return _then(
      _$QuickStatisticsStateImpl(
        chartStats: freezed == chartStats
            ? _value._chartStats
            : chartStats // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
        chartRangeStart: freezed == chartRangeStart
            ? _value.chartRangeStart
            : chartRangeStart // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        chartRangeEnd: freezed == chartRangeEnd
            ? _value.chartRangeEnd
            : chartRangeEnd // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        selectedDayIndex: freezed == selectedDayIndex
            ? _value.selectedDayIndex
            : selectedDayIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$QuickStatisticsStateImpl extends _QuickStatisticsState {
  const _$QuickStatisticsStateImpl({
    final List<int>? chartStats,
    this.chartRangeStart,
    this.chartRangeEnd,
    this.selectedDayIndex,
  }) : _chartStats = chartStats,
       super._();

  final List<int>? _chartStats;
  @override
  List<int>? get chartStats {
    final value = _chartStats;
    if (value == null) return null;
    if (_chartStats is EqualUnmodifiableListView) return _chartStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? chartRangeStart;
  @override
  final DateTime? chartRangeEnd;
  @override
  final int? selectedDayIndex;

  @override
  String toString() {
    return 'QuickStatisticsState(chartStats: $chartStats, chartRangeStart: $chartRangeStart, chartRangeEnd: $chartRangeEnd, selectedDayIndex: $selectedDayIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickStatisticsStateImpl &&
            const DeepCollectionEquality().equals(
              other._chartStats,
              _chartStats,
            ) &&
            (identical(other.chartRangeStart, chartRangeStart) ||
                other.chartRangeStart == chartRangeStart) &&
            (identical(other.chartRangeEnd, chartRangeEnd) ||
                other.chartRangeEnd == chartRangeEnd) &&
            (identical(other.selectedDayIndex, selectedDayIndex) ||
                other.selectedDayIndex == selectedDayIndex));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_chartStats),
    chartRangeStart,
    chartRangeEnd,
    selectedDayIndex,
  );

  /// Create a copy of QuickStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickStatisticsStateImplCopyWith<_$QuickStatisticsStateImpl>
  get copyWith =>
      __$$QuickStatisticsStateImplCopyWithImpl<_$QuickStatisticsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _QuickStatisticsState extends QuickStatisticsState {
  const factory _QuickStatisticsState({
    final List<int>? chartStats,
    final DateTime? chartRangeStart,
    final DateTime? chartRangeEnd,
    final int? selectedDayIndex,
  }) = _$QuickStatisticsStateImpl;
  const _QuickStatisticsState._() : super._();

  @override
  List<int>? get chartStats;
  @override
  DateTime? get chartRangeStart;
  @override
  DateTime? get chartRangeEnd;
  @override
  int? get selectedDayIndex;

  /// Create a copy of QuickStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickStatisticsStateImplCopyWith<_$QuickStatisticsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
