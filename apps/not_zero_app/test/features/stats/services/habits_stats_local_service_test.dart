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
import 'package:not_zero_app/src/features/stats/models/habits_counting_data.dart';
import 'package:not_zero_app/src/features/stats/services/habits_stats_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:uuid/uuid.dart';

void main() {
  late NotZeroDatabase db;
  late HabitsStatsLocalService service;

  setUp(() {
    db = NotZeroDatabase.memory();
    service = HabitsStatsLocalService(db);
  });

  tearDown(() => db.close());

  group('HabitsStatsLocalService', () {
    const uuid = Uuid();

    test('should count created habits in period', () async {
      final now = DateTime.now();
      await db
          .into(db.habitsTable)
          .insert(
            Habit(
              id: uuid.v4(),
              title: 'Habit 1',
              createdAt: now,
            ).toInsertable(),
          );
      await db
          .into(db.habitsTable)
          .insert(
            Habit(
              id: uuid.v4(),
              title: 'Habit 2',
              createdAt: now.subtract(const Duration(days: 2)),
            ).toInsertable(),
          );

      final result = await service.countHabitStats(
        startPeriod: now.startOfDay,
        endPeriod: now.endOfDay,
      );

      expect(result.created, 1);
    });

    test('should count completed habits correctly in period', () async {
      final now = DateTime(2023, 1, 1, 12); // Noon
      final habitId = uuid.v4();

      await db
          .into(db.habitsTable)
          .insert(
            Habit(
              id: habitId,
              title: 'Habit 1',
              createdAt: now.subtract(const Duration(days: 10)),
              importance: TaskImportance.important,
            ).toInsertable(),
          );

      // Completion today
      await db
          .into(db.habitCompletionsTable)
          .insert(
            HabitCompletion(
              id: uuid.v4(),
              habitId: habitId,
              type: HabitCompletionType.completed,
              completedDate: now,
            ).toInsertable(),
          );

      // Completion yesterday
      await db
          .into(db.habitCompletionsTable)
          .insert(
            HabitCompletion(
              id: uuid.v4(),
              habitId: habitId,
              type: HabitCompletionType.completed,
              completedDate: now.subtract(const Duration(days: 1)),
            ).toInsertable(),
          );

      final result = await service.countHabitStats(
        startPeriod: now.startOfDay,
        endPeriod: now.endOfDay,
      );

      // All combinations are initialized
      expect(
        result.completed.length,
        TaskImportance.values.length * HabitStreakPeriod.values.length,
      );

      // Key is Record (importance, streakPeriod)
      const key = (
        importance: TaskImportance.important,
        streakPeriod: HabitStreakPeriod.fewDays,
      );
      expect(result.completed[key], 1);
    });

    test(
      'Day Edge: should NOT count completion from next day 00:00:00',
      () async {
        final day1 = DateTime(2023);
        final day2 = DateTime(2023, 1, 2); // 00:00:00

        final habitId = uuid.v4();
        // Habit with Normal importance
        await db
            .into(db.habitsTable)
            .insert(
              Habit(
                id: habitId,
                title: 'Habit 1',
                createdAt: day1,
              ).toInsertable(),
            );

        // Completion on Day 2 00:00:00
        await db
            .into(db.habitCompletionsTable)
            .insert(
              HabitCompletion(
                id: uuid.v4(),
                habitId: habitId,
                type: HabitCompletionType.completed,
                completedDate: day2,
              ).toInsertable(),
            );

        // Query Day 1 [00:00:00, 23:59:59.999]
        final result = await service.countHabitStats(
          startPeriod: day1.startOfDay,
          endPeriod: day1.endOfDay,
        );

        const key = (
          importance: TaskImportance.normal,
          streakPeriod: HabitStreakPeriod.fewDays,
        );

        expect(
          result.completed[key],
          0,
          reason: 'Should count 0 for Day 2 completion in Day 1',
        );
      },
    );

    test('Day Edge: should count completion on Day 1', () async {
      final day1 = DateTime(2023);

      final habitId = uuid.v4();
      // Habit with Normal importance
      await db
          .into(db.habitsTable)
          .insert(
            Habit(
              id: habitId,
              title: 'Habit 1',
              createdAt: day1,
            ).toInsertable(),
          );

      // Completion on Day 1
      await db
          .into(db.habitCompletionsTable)
          .insert(
            HabitCompletion(
              id: uuid.v4(),
              habitId: habitId,
              type: HabitCompletionType.completed,
              completedDate: day1,
            ).toInsertable(),
          );

      // Query Day 1
      final result = await service.countHabitStats(
        startPeriod: day1.startOfDay,
        endPeriod: day1.endOfDay,
      );

      const key = (
        importance: TaskImportance.normal,
        streakPeriod: HabitStreakPeriod.fewDays,
      );

      expect(result.completed[key], 1);
    });
  });
}
