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
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/habits/models/habit_action.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class HabitsCompletionsHistoryNotifier
    extends AsyncNotifier<List<Pair<DateTime, HabitCompletion?>>> {
  HabitsCompletionsHistoryNotifier({
    required this.habit,
    required this.daysCount,
  });

  final Habit habit;
  final int daysCount;

  @override
  FutureOr<List<Pair<DateTime, HabitCompletion?>>> build() {
    ref.listenActions<HabitAction>(_handleHabitAction);

    final repository = ref.watch(habitsRepositoryProvider);
    return repository.getHabitCompletionsAroundDate(
      habitId: habit.id,
      daysBefore: daysCount - 1,
    );
  }

  void _handleHabitAction(HabitAction action) {
    final currentState = state.value;
    if (currentState == null) return;

    switch (action) {
      case HabitActionCompleted(:final habit, :final completion):
        if (habit.id != this.habit.id) return;
        final newState = List.of(currentState);
        newState[_indexForDate(newState, completion.completedDate)] = (
          completion.completedDate,
          completion,
        );
        state = AsyncValue.data(newState);

      case HabitActionNotCompleted(:final habit, :final completion):
        if (habit.id != this.habit.id) return;
        final newState = List.of(currentState);
        newState[_indexForDate(newState, completion.completedDate)] = (
          completion.completedDate,
          null,
        );
        state = AsyncValue.data(newState);

      default:
        return;
    }
  }

  int _indexForDate(
    List<Pair<DateTime, HabitCompletion?>> state,
    DateTime date,
  ) {
    // Binary search for the index of the date in the state.
    // It assumes that state is sorted by date (first element in the pair).
    var left = 0;
    var right = state.length - 1;
    while (left <= right) {
      final mid = left + ((right - left) >> 1);
      final cmp = state[mid].$1;
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
