import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class HabitsLocalService implements BaseService {
  const HabitsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<Habit>> getHabitsWithCompletions({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _db.transaction(() async {
      final habitsQuery =
          _db.select(_db.habitsTable).join([
              leftOuterJoin(
                _db.habitsTagEntries,
                _db.habitsTagEntries.habit.equalsExp(_db.habitsTable.id),
                useColumns: false,
              ),
            ])
            ..addColumns([_db.habitsTagEntries.tagsList])
            ..groupBy([_db.habitsTable.id]);

      final tagsMapper = TagsEfficientMapper(_db);

      return habitsQuery.asyncMap((row) async {
        final habit = row.readTable(_db.habitsTable);
        final tags = await tagsMapper.readHabitTags(row);
        final completions = await _getHabitCompletions(
          habitId: habit.id,
          startDate: startDate,
          endDate: endDate,
        );
        return habit.copyWith(
          completions: completions,
          tags: tags,
        );
      }).get();
    });
  }

  Future<List<HabitCompletion>> _getHabitCompletions({
    required String habitId,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (_db.select(
          _db.habitCompletionsTable,
        )..where(
          (tbl) =>
              tbl.habitId.equals(habitId) &
              tbl.completedDate.dayInRange(startDate, endDate),
        ))
        .get();
  }

  Future<void> saveHabit(Habit habit) {
    return _db.transaction(() async {
      await _db
          .into(_db.habitsTable)
          .insertOnConflictUpdate(habit.toInsertable());
      await (_db.delete(
        _db.habitsTagEntries,
      )..where((tbl) => tbl.habit.equals(habit.id))).go();
      for (final tag in habit.tags) {
        await _db
            .into(_db.habitsTagEntries)
            .insertOnConflictUpdate(
              HabitsTagEntry(habit: habit.id, tag: tag.id),
            );
      }
    });
  }

  Future<void> saveCompletion(HabitCompletion completion) {
    return _db
        .into(_db.habitCompletionsTable)
        .insertOnConflictUpdate(completion.toInsertable());
  }

  Future<void> deleteHabit(Habit habit) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.habitsTagEntries,
      )..where((tbl) => tbl.habit.equals(habit.id))).go();
      await (_db.delete(
        _db.habitCompletionsTable,
      )..where((tbl) => tbl.habitId.equals(habit.id))).go();
      await (_db.delete(
        _db.habitsTable,
      )..where((tbl) => tbl.id.equals(habit.id))).go();
    });
  }
}
