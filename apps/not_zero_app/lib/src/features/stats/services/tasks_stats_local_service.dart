import 'package:drift/drift.dart';
import 'package:not_zero_app/src/features/stats/models/tasks_counting_data.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/nz_drift.dart';

class TasksStatsLocalService {
  const TasksStatsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<TasksCountingData> countTaskStats({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    const enumConverter = EnumIndexConverter(TaskImportance.values);
    return _db.transaction(() async {
      return TasksCountingData(
        notImportant: await _completedInPeriodByImportance(
          importance: enumConverter.toSql(TaskImportance.notImportant),
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
        normal: await _completedInPeriodByImportance(
          importance: enumConverter.toSql(TaskImportance.normal),
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
        important: await _completedInPeriodByImportance(
          importance: enumConverter.toSql(TaskImportance.important),
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
        created: await _createdInPeriod(
          startPeriod: startPeriod,
          endPeriod: endPeriod,
        ),
      );
    });
  }

  Future<int> _completedInPeriodByImportance({
    required int importance,
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query = _db.selectOnly(_db.tasksTable)
      ..addColumns({countAll()})
      ..where(
        _db.tasksTable.completedAt.inPeriod(startPeriod, endPeriod) &
            _db.tasksTable.importance.equals(importance),
      );
    final result = await query.getSingleOrNull();
    return result?.read(countAll()) ?? 0;
  }

  Future<int> _createdInPeriod({
    DateTime? startPeriod,
    DateTime? endPeriod,
  }) async {
    final query = _db.selectOnly(_db.tasksTable)
      ..addColumns({countAll()})
      ..where(_db.tasksTable.createdAt.inPeriod(startPeriod, endPeriod));
    final result = await query.getSingleOrNull();
    return result?.read(countAll()) ?? 0;
  }
}
