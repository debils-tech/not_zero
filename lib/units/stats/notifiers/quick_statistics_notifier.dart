import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/stats/di.dart';
import 'package:not_zero/units/stats/models/quick_statistics_state.dart';
import 'package:nz_common/nz_common.dart';

class QuickStatisticsNotifier
    extends Notifier<QuickStatisticsState> {
  @override
  QuickStatisticsState build() {
    loadDays();

    return const QuickStatisticsState();
  }

  Future<void> loadDays([DateTime? start, DateTime? end]) async {
    final rangeStart = start ?? DateTime.now().startOfWeek;
    final rangeEnd = end ?? DateTime.now().endOfWeek;

    final repository = ref.read(statsRepositoryProvider);
    final weeklyStats = await repository.getStatsByDays(rangeStart, rangeEnd);

    state = QuickStatisticsState(
      chartStats: weeklyStats,
      chartRangeStart: rangeStart,
      chartRangeEnd: rangeEnd,
      selectedDayIndex:
          state.selectedDayIndex ?? _findTodayInRange(rangeStart, rangeEnd),
    );
  }

  int? _findTodayInRange(DateTime start, DateTime end) {
    final today = DateTime.now();

    if (today.isAfter(start) && today.isBefore(end)) {
      // Works onlt if we want to show only a week.
      return today.weekday - 1;
    }

    return null;
  }

  void selectDay(int selectIndex) {
    if (selectIndex == state.selectedDayIndex || selectIndex < 0) return;

    state = state.copyWith(selectedDayIndex: selectIndex);
  }
}
