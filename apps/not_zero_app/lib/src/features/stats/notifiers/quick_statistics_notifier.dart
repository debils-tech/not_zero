// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/features/stats/models/quick_statistics_state.dart';
import 'package:nz_common/nz_common.dart';

class QuickStatisticsNotifier extends Notifier<QuickStatisticsState> {
  @override
  QuickStatisticsState build() {
    unawaited(loadDays());

    return const QuickStatisticsState();
  }

  Future<void> loadDays([DateTime? start, DateTime? end]) async {
    final rangeStart = start ?? .now().startOfWeek;
    final rangeEnd = end ?? .now().endOfWeek;

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
