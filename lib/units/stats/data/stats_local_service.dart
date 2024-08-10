import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/db/provider.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

@lazySingleton
class StatsLocalService {
  StatsLocalService(StorageProvider storage) {
    _db = storage.database;
  }

  late final NotZeroDatabase _db;

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
