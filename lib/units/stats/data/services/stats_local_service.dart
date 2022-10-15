import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class StatsLocalService {
  Future<List<TaskImportance>> getCompletedTasksImportance();
}

@LazySingleton(as: StatsLocalService)
class StatsLocalServiceImpl implements StatsLocalService {
  StatsLocalServiceImpl(StorageProvider storage) {
    _db = storage.database;
  }

  late final NotZeroDatabase _db;

  @override
  Future<List<TaskImportance>> getCompletedTasksImportance() async {
    final completedTasks = await (_db.select(_db.tasksTable)
          ..where((tbl) => tbl.completedAt.isNotNull()))
        .get();

    return completedTasks.map((e) => e.importance).toList();
  }
}
