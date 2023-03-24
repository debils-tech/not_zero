part of 'quick_statistics_cubit.dart';

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
