import 'package:drift/drift.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_base_models/nz_base_models.dart';

class StatsLocalService {
  StatsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<TaskImportance>> getCompletedTasksImportance({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query = _db.select(_db.tasksTable)
      ..where((taskTable) {
        final completed = taskTable.completedAt.isNotNull();
        if (startPeriod == null && endPeriod == null) {
          // in range (-inf, +inf)
          return completed;
        }

        if (startPeriod == null && endPeriod != null) {
          // in range (-inf, end]
          return completed &
              taskTable.completedAt.isSmallerOrEqualValue(endPeriod);
        }

        if (startPeriod != null && endPeriod == null) {
          // in range [start, +inf)
          return completed &
              taskTable.completedAt.isBiggerOrEqualValue(startPeriod);
        }

        // in range [start, end]
        return completed &
            taskTable.completedAt.isSmallerOrEqualValue(endPeriod!) &
            taskTable.completedAt.isBiggerOrEqualValue(startPeriod!);
        // taskTable.completedAt.isBetweenValues(startPeriod!, endPeriod!);
      });

    final completedTasks = await query.map((e) => e.importance).get();

    return completedTasks;
  }
}
