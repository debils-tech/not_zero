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

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/habits/models/habit_action.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';
import 'package:nz_base_models/nz_base_models.dart';

typedef HomePendingHabit = ({
  Habit habit,
  int streak,
  HabitCompletion? todayCompletion,
});

class HomeTodayHabitsNotifier extends AsyncNotifier<List<HomePendingHabit>> {
  @override
  Future<List<HomePendingHabit>> build() async {
    ref.listenActions<HabitAction>(_handleHabitAction);
    return _loadHabits();
  }

  void _handleHabitAction(HabitAction action) {
    switch (action) {
      case HabitActionCreated() ||
          HabitActionUpdated() ||
          HabitActionDeletedMultiple() ||
          HabitActionCompleted() ||
          HabitActionNotCompleted():
        ref.invalidateSelf();
    }
  }

  Future<List<HomePendingHabit>> _loadHabits() async {
    final repository = ref.watch(habitsRepositoryProvider);
    final habits = await repository.getAllHabits();
    final pendingHabits = <HomePendingHabit>[];

    for (final habit in habits) {
      final streak = await repository.getHabitStreak(habit: habit);
      if (streak == 0) continue;

      final todayCompletion = (await repository.getHabitCompletionsAroundDate(
        habitId: habit.id,
      )).lastOrNull?.$2;
      if (todayCompletion?.type == HabitCompletionType.completed) continue;

      pendingHabits.add(
        (
          habit: habit,
          streak: streak,
          todayCompletion: todayCompletion,
        ),
      );
    }

    pendingHabits.sort((a, b) {
      final importanceComparison = b.habit.importance.index.compareTo(
        a.habit.importance.index,
      );
      if (importanceComparison != 0) return importanceComparison;
      return b.streak.compareTo(a.streak);
    });
    return pendingHabits;
  }
}
