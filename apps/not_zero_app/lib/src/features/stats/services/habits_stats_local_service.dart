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
import 'package:not_zero_app/src/features/stats/models/habits_counting_data.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class HabitsStatsLocalService implements BaseService {
  const HabitsStatsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<HabitsCountingData> countHabitStats({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    // Getting habits by each importance
    final habitsByImportance = TaskImportance.values
        .map<Pair<TaskImportance, BaseSelectStatement<TypedResult>>>(
          (importance) => (
            importance,
            _db.selectOnly(_db.habitsTable)
              ..addColumns([_db.habitsTable.id])
              ..where(_db.habitsTable.importance.equalsValue(importance)),
          ),
        );
    // Creating additional mappings for completions by streak period
    // (also filtering habits by importance)
    final completionsByStreakPeriod = habitsByImportance
        .expand(
          (e) => _countCompletionsByStreakPeriod(
            e.$1,
            e.$2,
            startPeriod: startPeriod,
            endPeriod: endPeriod,
          ),
        )
        .toList();
    // Getting total number of created habits in the queried period
    final createdInPeriod = subqueryExpression<int>(
      _db.selectOnly(_db.habitsTable)
        ..addColumns({countAll()})
        ..where(_db.habitsTable.createdAt.inPeriod(startPeriod, endPeriod)),
    );

    // Getting the results
    final resultSet = await _db.selectExpressions([
      ...completionsByStreakPeriod.map((e) => e.$3),
      createdInPeriod,
    ]).getSingle();

    return HabitsCountingData(
      completed: Map.fromEntries(
        completionsByStreakPeriod.map(
          (e) => MapEntry(
            (importance: e.$1, streakPeriod: e.$2),
            resultSet.read(e.$3) ?? 0,
          ),
        ),
      ),
      created: resultSet.read(createdInPeriod) ?? 0,
    );
  }

  Iterable<Triple<TaskImportance, HabitStreakPeriod, Expression<int>>>
  _countCompletionsByStreakPeriod(
    TaskImportance importance,
    BaseSelectStatement<TypedResult> habitsIds, {
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) {
    return HabitStreakPeriod.values.map(
      (streak) => (
        importance,
        streak,
        subqueryExpression(
          _db.selectOnly(_db.habitCompletionsTable)
            ..addColumns({countAll()})
            ..where(_db.habitCompletionsTable.habitId.isInQuery(habitsIds))
            ..where(
              _db.habitCompletionsTable.completedDate.dayInRange(
                startPeriod,
                endPeriod,
              ),
            )
            ..where(
              _isInStreakPeriod(_db.habitCompletionsTable.streakCount, streak),
            ),
        ),
      ),
    );
  }

  Expression<bool> _isInStreakPeriod(
    Expression<int> streakCount,
    HabitStreakPeriod streakPeriod,
  ) {
    final maxDays = streakPeriod.maxDays;
    return streakCount.isBiggerOrEqualValue(streakPeriod.minDays) &
        (maxDays == null
            ? const Constant(true)
            : streakCount.isSmallerThanValue(maxDays));
  }
}
