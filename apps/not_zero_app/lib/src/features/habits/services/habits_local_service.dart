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
  }) async {
    return _db.transaction(() {
      return _db.select(_db.habitsTable).asyncMap((habit) async {
        final completions = await _getHabitCompletions(
          habitId: habit.id,
          startDate: startDate,
          endDate: endDate,
        );
        return habit.copyWith(completions: completions);
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
    return _db
        .into(_db.habitsTable)
        .insertOnConflictUpdate(habit.toInsertable());
  }

  Future<void> saveCompletion(HabitCompletion completion) {
    return _db
        .into(_db.habitCompletionsTable)
        .insertOnConflictUpdate(completion.toInsertable());
  }

  Future<void> deleteHabit(Habit habit) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.habitCompletionsTable,
      )..where((tbl) => tbl.habitId.equals(habit.id))).go();
      await (_db.delete(
        _db.habitsTable,
      )..where((tbl) => tbl.id.equals(habit.id))).go();
    });
  }
}
