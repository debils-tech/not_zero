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
import 'package:not_zero_app/src/features/habits/models/habit_action.dart';
import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class HabitsRepository implements BaseRepository {
  const HabitsRepository(this._localService, this._actionsBus);

  final HabitsLocalService _localService;
  final ActionsBus _actionsBus;

  Future<List<Habit>> getAllHabits() => _localService.getHabits();

  Future<void> addHabit(Habit habit) {
    _actionsBus.emit(HabitAction.created(habit: habit));

    return _localService.saveHabit(habit);
  }

  Future<void> updateHabit({
    required Habit oldHabit,
    required Habit newHabit,
  }) {
    _actionsBus.emit(
      HabitAction.updated(oldHabit: oldHabit, newHabit: newHabit),
    );

    return _localService.saveHabit(newHabit);
  }

  Future<void> deleteHabits(Iterable<Habit> habits) {
    _actionsBus.emit(HabitAction.deleted(habits: habits));

    return _localService.deleteHabits(habits.map((e) => e.id).toSet());
  }

  Future<List<Pair<DateTime, HabitCompletion?>>> getHabitCompletionsAroundDate({
    required String habitId,
    int daysBefore = 0,
    int daysAfter = 0,
  }) async {
    final today = DateTime.now();
    final startDate = today.subtract(Duration(days: daysBefore));
    final endDate = today.add(Duration(days: daysAfter));

    final completions = await _localService.getHabitCompletions(
      habitId: habitId,
      startDate: startDate,
      endDate: endDate,
    );

    return startDate
        .rangeToIncluding(endDate)
        .map(
          (date) => (
            date,
            completions.firstWhereOrNull(
              (completion) => completion.completedDate.isAtSameDay(date),
            ),
          ),
        )
        .toList();
  }

  Future<int> getHabitStreak({required Habit habit, DateTime? date}) async {
    return _localService.getHabitStreak(
      habitId: habit.id,
      streakDate: date ?? DateTime.now(),
    );
  }

  Future<void> addHabitCompletion({
    required Habit habit,
    required HabitCompletion completion,
  }) async {
    final streakForCompletion = await _localService.getHabitStreak(
      habitId: habit.id,
      streakDate: completion.completedDate,
    );
    completion = completion.copyWith(streakCount: streakForCompletion + 1);

    _actionsBus.emit(
      HabitAction.completed(habit: habit, completion: completion),
    );

    return _localService.saveCompletion(completion);
  }

  Future<void> deleteHabitCompletion({
    required Habit habit,
    required HabitCompletion completion,
  }) {
    _actionsBus.emit(
      HabitAction.notCompleted(habit: habit, completion: completion),
    );

    return _localService.deleteCompletion(completion);
  }
}
