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
