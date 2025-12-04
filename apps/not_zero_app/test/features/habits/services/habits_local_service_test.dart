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

    group('Streak Logic', () {
      test(
        'should propagate streak updates to future completions on insert',
        () async {
          final habit = Habit(
            id: const Uuid().v4(),
            title: 'Streak Habit',
            createdAt: DateTime.now(),
          );
          await habitsLocalService.saveHabit(habit);

          // Use midnight to avoid time stripping issues during round-trip
          final baseDate = DateTime(2024);

          // Insert Day 1: Streak 1
          final day1 = HabitCompletion(
            id: const Uuid().v4(),
            habitId: habit.id,
            type: HabitCompletionType.completed,
            completedDate: baseDate,
          );
          await habitsLocalService.saveCompletion(day1);

          // Insert Day 3: Streak 1 (Gap day 2, so it starts fresh at 1)
          final day3 = HabitCompletion(
            id: const Uuid().v4(),
            habitId: habit.id,
            type: HabitCompletionType.completed,
            completedDate: baseDate.add(const Duration(days: 2)),
          );
          await habitsLocalService.saveCompletion(day3);

          // Verify initial state
          var completions = await habitsLocalService.getHabitCompletions(
            habitId: habit.id,
            startDate: baseDate,
            endDate: baseDate.add(const Duration(days: 5)),
          );
          expect(completions.length, 2);
          expect(
            completions
                .firstWhere((c) => c.completedDate.isAtSameMomentAs(baseDate))
                .streakCount,
            1,
          );
          expect(
            completions
                .firstWhere(
                  (c) => c.completedDate.isAtSameMomentAs(
                    baseDate.add(const Duration(days: 2)),
                  ),
                )
                .streakCount,
            1,
          );

          // Insert Day 2: Should connect Day 1 and Day 3.
          // Caller is responsible for calculating Day 2 streak based on Day 1.
          // Day 1 (S1) -> Day 2 (S2).
          final day2 = HabitCompletion(
            id: const Uuid().v4(),
            habitId: habit.id,
            type: HabitCompletionType.completed,
            completedDate: baseDate.add(const Duration(days: 1)),
            streakCount: 2,
          );
          await habitsLocalService.saveCompletion(day2);

          // Verify propagation: Day 3 should now be updated to Streak 3.
          completions = await habitsLocalService.getHabitCompletions(
            habitId: habit.id,
            startDate: baseDate,
            endDate: baseDate.add(const Duration(days: 5)),
          );

          // Ensure ordered by date
          completions.sort(
            (a, b) => a.completedDate.compareTo(b.completedDate),
          );

          expect(completions.length, 3);
          expect(
            completions[0].streakCount,
            1,
            reason: 'Day 1 should remain 1',
          );
          expect(
            completions[1].streakCount,
            2,
            reason: 'Day 2 should be saved as 2',
          );
          expect(
            completions[2].streakCount,
            3,
            reason: 'Day 3 should be updated to 3',
          );
        },
      );

      test('should reset future streaks when a completion is deleted', () async {
        final habit = Habit(
          id: const Uuid().v4(),
          title: 'Streak Habit Delete',
          createdAt: DateTime.now(),
        );
        await habitsLocalService.saveHabit(habit);

        final baseDate = DateTime(2024);

        // Setup continuous streak: Day 1 (S1), Day 2 (S2), Day 3 (S3), Day 4 (S4)
        for (var i = 0; i < 4; i++) {
          await habitsLocalService.saveCompletion(
            HabitCompletion(
              id: const Uuid().v4(),
              habitId: habit.id,
              type: HabitCompletionType.completed,
              completedDate: baseDate.add(Duration(days: i)),
              streakCount: i + 1,
            ),
          );
        }

        // Verify setup
        var completions = await habitsLocalService.getHabitCompletions(
          habitId: habit.id,
          startDate: baseDate,
          endDate: baseDate.add(const Duration(days: 10)),
        );
        expect(completions.length, 4);
        expect(completions.last.streakCount, 4);

        // Delete Day 2
        // We need the exact completion object (ID matters for deletion)
        final day2Completion = completions.firstWhere(
          (c) => c.completedDate.isAtSameMomentAs(
            baseDate.add(const Duration(days: 1)),
          ),
        );
        await habitsLocalService.deleteCompletion(day2Completion);

        // Verify logic
        completions = await habitsLocalService.getHabitCompletions(
          habitId: habit.id,
          startDate: baseDate,
          endDate: baseDate.add(const Duration(days: 10)),
        );

        completions.sort((a, b) => a.completedDate.compareTo(b.completedDate));

        expect(completions.length, 3); // 1, 3, 4 (2 is deleted)

        // Day 1: Streak 1
        expect(completions[0].completedDate, baseDate);
        expect(completions[0].streakCount, 1);

        // Day 3: Should reset to 1 because the chain is broken
        expect(
          completions[1].completedDate,
          baseDate.add(const Duration(days: 2)),
        );
        expect(
          completions[1].streakCount,
          1,
          reason: 'Day 3 should reset to 1',
        );

        // Day 4: Should be 2 (1 + 1)
        expect(
          completions[2].completedDate,
          baseDate.add(const Duration(days: 3)),
        );
        expect(completions[2].streakCount, 2, reason: 'Day 4 should be 2');
      });
    });
  });
}
