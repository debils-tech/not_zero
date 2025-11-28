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
  }) {
    return _db.transaction(() async {
      // 1. We should get all unique combinations of importance and regularity
      // Only this 2 parameters are important for score calculation
      final habitsVariationsQuery = _db.habitsTable.selectOnly(distinct: true)
        ..addColumns({_db.habitsTable.importance, _db.habitsTable.regularity});
      final habitsVariations = await habitsVariationsQuery.asyncMap((
        row,
      ) async {
        // Just reading the values
        final importance = row.readWithConverter(
          _db.habitsTable.importance,
        );
        final regularity = row.readWithConverter(
          _db.habitsTable.regularity,
        );

        assert(
          importance != null && regularity != null,
          'Importance and regularity must not be null',
        );
        if (importance == null || regularity == null) return null;

        // 2. We should count all the completions for all these combinations
        // Count is enough since we will muliply it later
        return MapEntry<UniqueHabitCombination, int>(
          (importance: importance, regularity: regularity),
          await _completedInPeriodByImportance(
            importance: importance,
            regularity: regularity,
            startPeriod: startPeriod,
            endPeriod: endPeriod,
          ),
        );
      }).get();

      // 3. We should count all the created habits in the period
      return HabitsCountingData(
        completed: Map.fromEntries(habitsVariations.nonNulls),
        created: await _createdInPeriod(
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
      );
    });
  }

  Future<int> _completedInPeriodByImportance({
    required TaskImportance importance,
    required HabitRegularity regularity,
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query =
        _db.selectOnly(_db.habitCompletionsTable).join([
            innerJoin(
              _db.habitsTable,
              _db.habitCompletionsTable.habitId.equalsExp(_db.habitsTable.id),
            ),
          ])
          ..addColumns({countAll()})
          ..where(
            _db.habitCompletionsTable.completedDate.dayInRange(
                  startPeriod,
                  endPeriod,
                ) &
                _db.habitsTable.importance.equalsValue(importance) &
                _db.habitsTable.regularity.equalsValue(regularity),
          );
    final result = await query.getSingleOrNull();
    return result?.read(countAll()) ?? 0;
  }

  Future<int> _createdInPeriod({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query = _db.selectOnly(_db.habitsTable)
      ..addColumns({countAll()})
      ..where(_db.habitsTable.createdAt.inPeriod(startPeriod, endPeriod));
    final result = await query.getSingleOrNull();
    return result?.read(countAll()) ?? 0;
  }
}
