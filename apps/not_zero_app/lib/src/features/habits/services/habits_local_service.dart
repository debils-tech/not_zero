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

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class HabitsLocalService implements BaseService {
  const HabitsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<Habit>> getHabits() {
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
        return habit.copyWith(tags: tags);
      }).get();
    });
  }

  Future<List<HabitCompletion>> getHabitCompletions({
    required String habitId,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return (_db.select(
            _db.habitCompletionsTable,
          )
          ..where(
            (tbl) =>
                tbl.habitId.equals(habitId) &
                tbl.completedDate.dayInRange(startDate, endDate),
          )
          ..orderBy([
            (tbl) => OrderingTerm.asc(tbl.completedDate),
          ]))
        .get();
  }

  Future<int> getHabitStreak({
    required String habitId,
    required DateTime streakDate,
  }) async {
    final yesterday = streakDate.subtract(const Duration(days: 1));
    final lastCompletion =
        await (_db.select(_db.habitCompletionsTable)
              ..where(
                (tbl) =>
                    tbl.habitId.equals(habitId) &
                    tbl.completedDate.dayInRange(
                      yesterday,
                      streakDate,
                    ),
              )
              ..orderBy([(tbl) => OrderingTerm.desc(tbl.completedDate)])
              ..limit(1))
            .getSingleOrNull();
    return lastCompletion?.streakCount ?? 0;
  }

  /// Saves general habit information and tags.
  /// Does not save or delete tag entries or completions.
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

  Future<void> deleteCompletion(HabitCompletion completion) {
    return (_db.delete(
      _db.habitCompletionsTable,
    )..where((tbl) => tbl.id.equals(completion.id))).go();
  }

  Future<void> deleteHabits(Iterable<String> habits) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.habitsTagEntries,
      )..where((tbl) => tbl.habit.isIn(habits))).go();
      await (_db.delete(
        _db.habitCompletionsTable,
      )..where((tbl) => tbl.habitId.isIn(habits))).go();
      await (_db.delete(
        _db.habitsTable,
      )..where((tbl) => tbl.id.isIn(habits))).go();
    });
  }
}
