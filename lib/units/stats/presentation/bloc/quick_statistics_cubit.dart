import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/stats/presentation/bloc/states/quick_statistics_state.dart';

@injectable
class QuickStatisticsCubit extends Cubit<QuickStatisticsState> {
  QuickStatisticsCubit(this._repository) : super(QuickStatisticsState());

  final StatsRepository _repository;

  Future<void> loadDays([DateTime? start, DateTime? end]) async {
    final rangeStart = start ?? DateTime.now().startOfWeek;
    final rangeEnd = end ?? DateTime.now().endOfWeek;
    final weeklyStats = await _repository.getStatsByDays(rangeStart, rangeEnd);

    emit(
      QuickStatisticsState(
        chartStats: weeklyStats,
        chartRangeStart: rangeStart,
        chartRangeEnd: rangeEnd,
        selectedDayIndex:
            state.selectedDayIndex ?? _findTodayInRange(rangeStart, rangeEnd),
      ),
    );
  }

  int? _findTodayInRange(DateTime start, DateTime end) {
    final today = DateTime.now();

    if (today.isAfter(start) && today.isBefore(end)) {
      // Works while we want to show only a week
      return today.weekday - 1;
    }

    return null;
  }

  void selectDay(int selectIndex) {
    if (selectIndex == state.selectedDayIndex) return;

    emit(state.copyWith(selectedDayIndex: selectIndex));
  }
}
