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
    group('getHabitsWithCompletions', () {
      test(
        'returns habits with completions within the specified date range',
        () async {
          final habit1Id = const Uuid().v4();
          final habit2Id = const Uuid().v4();

          final habit1 = HabitsTableCompanion.insert(
            id: habit1Id,
            title: 'Habit 1',
            importance: TaskImportance.normal,
          );
          final habit2 = HabitsTableCompanion.insert(
            id: habit2Id,
            title: 'Habit 2',
            importance: TaskImportance.notImportant,
          );

          await db.into(db.habitsTable).insert(habit1);
          await db.into(db.habitsTable).insert(habit2);

          final now = DateTime.now();
          final completion1 = HabitCompletionsTableCompanion.insert(
            id: const Uuid().v4(),
            habitId: habit1Id,
            type: HabitCompletionType.completed,
            completedDate: now,
          );
          final completion2 = HabitCompletionsTableCompanion.insert(
            id: const Uuid().v4(),
            habitId: habit1Id,
            type: HabitCompletionType.completed,
            completedDate: now.subtract(const Duration(days: 1)),
          );
          // This one is outside the date range
          final completion3 = HabitCompletionsTableCompanion.insert(
            id: const Uuid().v4(),
            habitId: habit2Id,
            type: HabitCompletionType.completed,
            completedDate: now.subtract(const Duration(days: 5)),
          );

          await db.into(db.habitCompletionsTable).insert(completion1);
          await db.into(db.habitCompletionsTable).insert(completion2);
          await db.into(db.habitCompletionsTable).insert(completion3);

          final startDate = now.subtract(const Duration(days: 2));
          final endDate = now;

          final result = await habitsLocalService.getHabitsWithCompletions(
            startDate: startDate,
            endDate: endDate,
          );

          expect(result, isA<List<Habit>>());
          expect(result.length, 2);

          final resultHabit1 = result.firstWhere((h) => h.id == habit1Id);
          expect(resultHabit1.completions.length, 2);

          final resultHabit2 = result.firstWhere((h) => h.id == habit2Id);
          expect(resultHabit2.completions.length, 0);
        },
      );

      test('returns a habit with a full year of completions', () async {
        final habitId = const Uuid().v4();

        final habit = HabitsTableCompanion.insert(
          id: habitId,
          title: 'Yearly Habit',
          importance: TaskImportance.important,
        );
        await db.into(db.habitsTable).insert(habit);

        final now = DateTime.now();
        final completions = <HabitCompletionsTableCompanion>[];
        for (var i = 0; i < 365; i++) {
          completions.add(
            HabitCompletionsTableCompanion.insert(
              id: const Uuid().v4(),
              habitId: habitId,
              type: HabitCompletionType.completed,
              completedDate: now.subtract(Duration(days: i)),
            ),
          );
        }
        await db.batch((batch) {
          batch.insertAll(db.habitCompletionsTable, completions);
        });

        final startDate = now.subtract(const Duration(days: 364));
        final endDate = now;

        final result = await habitsLocalService.getHabitsWithCompletions(
          startDate: startDate,
          endDate: endDate,
        );

        expect(result.length, 1);
        expect(result.first.completions.length, 365);
      });

      test('returns correct completions for different date ranges', () async {
        final habitId = const Uuid().v4();

        final habit = HabitsTableCompanion.insert(
          id: habitId,
          title: 'Monthly Habit',
          importance: TaskImportance.important,
        );
        await db.into(db.habitsTable).insert(habit);

        final now = DateTime.now();
        final completions = <HabitCompletionsTableCompanion>[];
        for (var i = 0; i < 30; i++) {
          completions.add(
            HabitCompletionsTableCompanion.insert(
              id: const Uuid().v4(),
              habitId: habitId,
              type: HabitCompletionType.completed,
              completedDate: now.subtract(Duration(days: i)),
            ),
          );
        }
        await db.batch((batch) {
          batch.insertAll(db.habitCompletionsTable, completions);
        });

        // Range 1: 10 days in the middle of the month
        var startDate = now.subtract(const Duration(days: 20));
        var endDate = now.subtract(const Duration(days: 11));
        var result = await habitsLocalService.getHabitsWithCompletions(
          startDate: startDate,
          endDate: endDate,
        );
        expect(result.first.completions.length, 10);

        // Range 2: First 5 days
        startDate = now.subtract(const Duration(days: 4));
        endDate = now;
        result = await habitsLocalService.getHabitsWithCompletions(
          startDate: startDate,
          endDate: endDate,
        );
        expect(result.first.completions.length, 5);

        // Range 3: A range with no completions
        startDate = now.add(const Duration(days: 1));
        endDate = now.add(const Duration(days: 10));
        result = await habitsLocalService.getHabitsWithCompletions(
          startDate: startDate,
          endDate: endDate,
        );
        expect(result.first.completions.length, 0);
      });
    });
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
          type: HabitCompletionType.completed,
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
          type: HabitCompletionType.completed,
          completedDate: DateTime.now(),
        );
        await habitsLocalService.saveCompletion(completion);

        final updatedCompletion =
            completion.copyWith(type: HabitCompletionType.skipped);
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
          type: HabitCompletionType.completed,
          completedDate: DateTime.now(),
        );
        final completion2 = HabitCompletion(
          id: const Uuid().v4(),
          habitId: habit.id,
          type: HabitCompletionType.completed,
          completedDate: DateTime.now().subtract(const Duration(days: 1)),
        );
        await habitsLocalService.saveCompletion(completion1);
        await habitsLocalService.saveCompletion(completion2);

        await habitsLocalService.deleteHabit(habit);

        final habitResult = await db.select(db.habitsTable).get();
        final completionsResult =
            await db.select(db.habitCompletionsTable).get();

        expect(habitResult.isEmpty, isTrue);
        expect(completionsResult.isEmpty, isTrue);
      });
    });
  });
}
