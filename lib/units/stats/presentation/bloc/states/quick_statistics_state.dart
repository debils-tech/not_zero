import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_statistics_state.freezed.dart';

@freezed
class QuickStatisticsState with _$QuickStatisticsState {
  factory QuickStatisticsState({
    List<int>? chartStats,
    DateTime? chartRangeStart,
    DateTime? chartRangeEnd,
    int? selectedDayIndex,
  }) = _QuickStatisticsState;

  const QuickStatisticsState._();
}
