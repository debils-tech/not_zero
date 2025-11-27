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

import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:uuid/uuid.dart';

void main() {
  late NotZeroDatabase db;
  late HabitsLocalService habitsLocalService;

  setUp(() {
    db = NotZeroDatabase.memory();
    habitsLocalService = HabitsLocalService(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('HabitsLocalService', () {
    group('saveHabit', () {
      test('should insert a new habit if it does not exist', () async {
        final habit = Habit(
          id: const Uuid().v4(),
          title: 'New Habit',
          createdAt: DateTime.now(),
        );

        await habitsLocalService.saveHabit(habit);

        final result = await db.select(db.habitsTable).get();
        expect(result.length, 1);
        expect(result.first.id, habit.id);
        expect(result.first.title, 'New Habit');
      });

      test('should update an existing habit', () async {
        final habit = Habit(
          id: const Uuid().v4(),
          title: 'Original Title',
          createdAt: DateTime.now(),
        );
        await habitsLocalService.saveHabit(habit);

        final updatedHabit = habit.copyWith(title: 'Updated Title');
        await habitsLocalService.saveHabit(updatedHabit);

        final result = await db.select(db.habitsTable).get();
        expect(result.length, 1);
        expect(result.first.title, 'Updated Title');
      });
    });

    group('saveCompletion', () {
      test('should insert a new completion for a habit', () async {
        final habit = Habit(
          id: const Uuid().v4(),
          title: 'Habit with Completion',
          createdAt: DateTime.now(),
        );
        await habitsLocalService.saveHabit(habit);

        final completion = HabitCompletion(
          id: const Uuid().v4(),
          habitId: habit.id,
          type: .completed,
          completedDate: DateTime.now(),
        );
        await habitsLocalService.saveCompletion(completion);

        final result = await db.select(db.habitCompletionsTable).get();
        expect(result.length, 1);
        expect(result.first.id, completion.id);
        expect(result.first.type, HabitCompletionType.completed);
      });

      test('should update an existing completion', () async {
        final habit = Habit(
          id: const Uuid().v4(),
          title: 'Habit with Completion',
          createdAt: DateTime.now(),
        );
        await habitsLocalService.saveHabit(habit);

        final completion = HabitCompletion(
          id: const Uuid().v4(),
          habitId: habit.id,
          type: .completed,
          completedDate: DateTime.now(),
        );
        await habitsLocalService.saveCompletion(completion);

        final updatedCompletion = completion.copyWith(
          type: .skipped,
        );
        await habitsLocalService.saveCompletion(updatedCompletion);

        final result = await db.select(db.habitCompletionsTable).get();
        expect(result.length, 1);
        expect(result.first.type, HabitCompletionType.skipped);
      });
    });

    group('deleteHabit', () {
      test('should delete a habit and all its completions', () async {
        final habit = Habit(
          id: const Uuid().v4(),
          title: 'Habit to Delete',
          createdAt: DateTime.now(),
        );
        await habitsLocalService.saveHabit(habit);

        final completion1 = HabitCompletion(
          id: const Uuid().v4(),
          habitId: habit.id,
          type: .completed,
          completedDate: DateTime.now(),
        );
        final completion2 = HabitCompletion(
          id: const Uuid().v4(),
          habitId: habit.id,
          type: .completed,
          completedDate: DateTime.now().subtract(const Duration(days: 1)),
        );
        await habitsLocalService.saveCompletion(completion1);
        await habitsLocalService.saveCompletion(completion2);

        await habitsLocalService.deleteHabits([habit.id]);

        final habitResult = await db.select(db.habitsTable).get();
        final completionsResult = await db
            .select(db.habitCompletionsTable)
            .get();

        expect(habitResult.isEmpty, isTrue);
        expect(completionsResult.isEmpty, isTrue);
      });
    });
  });
}
