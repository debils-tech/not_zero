import 'package:drift/drift.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class StatsLocalService {
  StatsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<int> getScoreSum({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final filters =
        _createFilter(startPeriod: startPeriod, endPeriod: endPeriod);
    final scoreSum = _db.scoreEntryTable.score.sum();
    final query = _db.selectOnly(_db.scoreEntryTable)
      ..where(filters)
      ..addColumns([scoreSum]);
    final value = await query.map((row) => row.read(scoreSum)).getSingle();

    return value ?? 0;
  }

  Expression<bool> _createFilter({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) {
    final scoreTable = _db.scoreEntryTable;
    final dbFilters = <Expression<bool>>[];

    if (startPeriod != null) {
      dbFilters.add(scoreTable.createdAt.isBiggerOrEqualValue(startPeriod));
    }
    if (endPeriod != null) {
      dbFilters.add(scoreTable.createdAt.isSmallerOrEqualValue(endPeriod));
    }
    if (dbFilters.isEmpty) {
      return const Constant(true);
    }
    return Expression.and(dbFilters);
  }
}
