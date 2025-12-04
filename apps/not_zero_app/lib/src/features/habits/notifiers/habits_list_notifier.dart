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
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class HabitsListNotifier extends AsyncNotifier<List<Habit>> {
  @override
  Future<List<Habit>> build() async {
    return ref.watch(habitsRepositoryProvider).getAllHabits();
  }

  Future<void> addHabit(Habit habit) {
    state = AsyncData([habit, ...state.value ?? []]);
    return ref.watch(habitsRepositoryProvider).addHabit(habit);
  }

  Future<void> updateHabit(Habit habit) {
    final oldHabit = state.value?.firstWhereOrNull(
      (oldHabit) => oldHabit.id == habit.id,
    );
    if (oldHabit == null) {
      // Can't update a habit that isn't in the list
      return Future.value();
    }

    state = AsyncData([
      ...state.value?.map((e) => e.id == habit.id ? habit : e) ?? [habit],
    ]);

    return ref
        .watch(habitsRepositoryProvider)
        .updateHabit(
          oldHabit: oldHabit,
          newHabit: habit,
        );
  }

  Future<void> deleteHabits(Set<String> habits) {
    final (newList, takenList) =
        state.value?.takeWhere((e) => habits.contains(e.id)) ??
        (const <Habit>[], const <Habit>[]);
    state = AsyncData(newList);
    return ref.watch(habitsRepositoryProvider).deleteHabits(takenList);
  }
}
