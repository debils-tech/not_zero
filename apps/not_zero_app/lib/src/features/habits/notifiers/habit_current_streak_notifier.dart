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

class HabitCurrentStreakNotifier extends AsyncNotifier<int> {
  HabitCurrentStreakNotifier({
    required this.habit,
  });

  final Habit habit;

  @override
  Future<int> build() {
    ref.listenActions<HabitAction>(_handleHabitAction);
    final repository = ref.watch(habitsRepositoryProvider);
    return repository.getHabitStreak(habit: habit);
  }

  void _handleHabitAction(HabitAction action) {
    final currentState = state.value;
    if (currentState == null) return;

    switch (action) {
      case HabitActionCompleted(:final habit) ||
          HabitActionNotCompleted(:final habit):
        if (habit.id != this.habit.id) return;
        unawaited(
          ref
              .read(habitsRepositoryProvider)
              .getHabitStreak(habit: habit)
              .then((value) => state = AsyncValue.data(value)),
        );

      default:
        return;
    }
  }
}
