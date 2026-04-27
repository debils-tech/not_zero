// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/habits/models/habit_action.dart';
import 'package:not_zero_app/src/features/habits/models/habit_month_calendar_state.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class HabitMonthCompletionsNotifier
    extends AsyncNotifier<HabitMonthCalendarState> {
  HabitMonthCompletionsNotifier({required this.habit});

  final Habit habit;

  @override
  Future<HabitMonthCalendarState> build() async {
    ref.listenActions<HabitAction>(_handleHabitAction);
    final now = DateTime.now();
    return _loadMonth(now.year, now.month);
  }

  Future<void> goToPreviousMonth() async {
    final s = switch (state) {
      AsyncData<HabitMonthCalendarState>(:final value) => value,
      _ => null,
    };
    if (s == null || s.isReloading) return;

    final ny = s.month == 1 ? s.year - 1 : s.year;
    final nm = s.month == 1 ? 12 : s.month - 1;

    state = AsyncData(
      HabitMonthCalendarState(
        year: ny,
        month: nm,
        completions: s.completions,
        isReloading: true,
      ),
    );

    state = await AsyncValue.guard(() => _loadMonth(ny, nm));
  }

  Future<void> goToNextMonth() async {
    final s = switch (state) {
      AsyncData<HabitMonthCalendarState>(:final value) => value,
      _ => null,
    };
    if (s == null || s.isReloading) return;
    if (!HabitMonthCalendarState.canGoNextMonth(s.year, s.month)) return;

    final ny = s.month == 12 ? s.year + 1 : s.year;
    final nm = s.month == 12 ? 1 : s.month + 1;

    state = AsyncData(
      HabitMonthCalendarState(
        year: ny,
        month: nm,
        completions: s.completions,
        isReloading: true,
      ),
    );

    state = await AsyncValue.guard(() => _loadMonth(ny, nm));
  }

  Future<HabitMonthCalendarState> _loadMonth(int year, int month) async {
    final repository = ref.read(habitsRepositoryProvider);
    final firstDay = DateTime(year, month);
    final lastDay = firstDay.endOfMonth;

    final completions = await repository.getHabitCompletionsForDateRange(
      habitId: habit.id,
      startDate: firstDay,
      endDate: lastDay,
    );

    return HabitMonthCalendarState(
      year: year,
      month: month,
      completions: completions,
    );
  }

  void _handleHabitAction(HabitAction action) {
    final current = switch (state) {
      AsyncData<HabitMonthCalendarState>(:final value) => value,
      _ => null,
    };
    if (current == null || current.isReloading) return;

    switch (action) {
      case HabitActionCompleted(:final habit, :final completion):
        if (habit.id != this.habit.id) return;
        if (!_isInVisibleMonth(completion.completedDate, current)) return;
        final newCompletions = List<Pair<DateTime, HabitCompletion?>>.of(
          current.completions,
        );
        final index = _indexForDate(newCompletions, completion.completedDate);
        if (index != -1) {
          newCompletions[index] = (
            completion.completedDate,
            completion,
          );
          state = AsyncValue.data(
            current.copyWith(completions: newCompletions),
          );
        }

      case HabitActionNotCompleted(:final habit, :final completion):
        if (habit.id != this.habit.id) return;
        if (!_isInVisibleMonth(completion.completedDate, current)) return;
        final newCompletions = List<Pair<DateTime, HabitCompletion?>>.of(
          current.completions,
        );
        final index = _indexForDate(newCompletions, completion.completedDate);
        if (index != -1) {
          newCompletions[index] = (
            completion.completedDate,
            null,
          );
          state = AsyncValue.data(
            current.copyWith(completions: newCompletions),
          );
        }

      default:
        return;
    }
  }

  bool _isInVisibleMonth(DateTime date, HabitMonthCalendarState s) =>
      date.year == s.year && date.month == s.month;

  int _indexForDate(
    List<Pair<DateTime, HabitCompletion?>> list,
    DateTime date,
  ) {
    var left = 0;
    var right = list.length - 1;
    while (left <= right) {
      final mid = left + ((right - left) >> 1);
      final cmp = list[mid].$1;
      if (cmp.isAtSameDay(date)) {
        return mid;
      } else if (cmp.isBefore(date)) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return -1;
  }
}
