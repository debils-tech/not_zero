import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_app/src/features/stats/services/tasks_stats_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:uuid/uuid.dart';

void main() {
  late NotZeroDatabase db;
  late TasksStatsLocalService service;

  setUp(() {
    db = NotZeroDatabase.memory();
    service = TasksStatsLocalService(db);
  });

  tearDown(() => db.close());

  group('TasksStatsLocalService', () {
    const uuid = Uuid();

    test('should count created tasks in period', () async {
      final now = DateTime.now();
      await db
          .into(db.tasksTable)
          .insert(
            Task(
              id: uuid.v4(),
              title: 'Task 1',
              createdAt: now,
            ).toInsertable(),
          );
      await db
          .into(db.tasksTable)
          .insert(
            Task(
              id: uuid.v4(),
              title: 'Task 2',
              createdAt: now.subtract(const Duration(days: 2)),
            ).toInsertable(),
          );

      final result = await service.countTaskStats(
        startPeriod: now.startOfDay,
        endPeriod: now.endOfDay,
      );

      expect(result.created, 1);
    });

    test('should count completed tasks by importance in period', () async {
      final now = DateTime(2023, 1, 1, 12);

      // Completed Important Task
      await db
          .into(db.tasksTable)
          .insert(
            Task(
              id: uuid.v4(),
              title: 'Task 1',
              createdAt: now,
              completedAt: now,
            ).toInsertable(),
          );

      // Completed Normal Task
      await db
          .into(db.tasksTable)
          .insert(
            Task(
              id: uuid.v4(),
              title: 'Task 2',
              createdAt: now,
              completedAt: now,
            ).toInsertable(),
          );

      // Completed Old Task
      await db
          .into(db.tasksTable)
          .insert(
            Task(
              id: uuid.v4(),
              title: 'Task 3',
              createdAt: now,
              completedAt: now.subtract(const Duration(days: 1)),
            ).toInsertable(),
          );

      final result = await service.countTaskStats(
        startPeriod: now.startOfDay,
        endPeriod: now.endOfDay,
      );

      expect(result.important, 1);
      expect(result.normal, 1);
      expect(result.notImportant, 0);
    });

    test(
      'Day Edge: should NOT count task completed at next day 00:00:00',
      () async {
        final day1 = DateTime(2023);
        final day2 = DateTime(2023, 1, 2); // 00:00:00

        await db
            .into(db.tasksTable)
            .insert(
              Task(
                id: uuid.v4(),
                title: 'Task 1',
                createdAt: day1,
                completedAt: day2, // Next day start
              ).toInsertable(),
            );

        // Query Day 1 [00:00:00, 23:59:59.999]
        final result = await service.countTaskStats(
          startPeriod: day1.startOfDay,
          endPeriod: day1.endOfDay,
        );

        expect(
          result.normal,
          0,
          reason: 'Task at 00:00:00 next day should not be in Day 1',
        );
      },
    );

    test('Day Edge: should count task completed at 23:59:59', () async {
      final day1 = DateTime(2023);
      final endOfDay = DateTime(2023, 1, 1, 23, 59, 59);

      await db
          .into(db.tasksTable)
          .insert(
            Task(
              id: uuid.v4(),
              title: 'Task 1',
              createdAt: day1,
              completedAt: endOfDay,
            ).toInsertable(),
          );

      final result = await service.countTaskStats(
        startPeriod: day1.startOfDay,
        endPeriod: day1.endOfDay,
      );

      expect(result.normal, 1);
    });

    test(
      'Day Edge: Task exactly at endPeriod boundary (23:59:59.999)',
      () async {
        final day1 = DateTime(2023);
        // If stored as int seconds, .999 is truncated to 59s, so it should match
        final endMoment = DateTime(2023, 1, 1, 23, 59, 59, 999);

        await db
            .into(db.tasksTable)
            .insert(
              Task(
                id: uuid.v4(),
                title: 'Task 1',
                createdAt: day1,
                completedAt: endMoment,
              ).toInsertable(),
            );

        final result = await service.countTaskStats(
          startPeriod: day1.startOfDay,
          endPeriod: day1.endOfDay,
        );

        expect(result.normal, 1);
      },
    );
  });
}
