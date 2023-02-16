import 'package:injectable/injectable.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

@lazySingleton
class TasksLocalService {
  TasksLocalService(StorageProvider storage) {
    _db = storage.database;
  }

  late final NotZeroDatabase _db;

  Future<List<Task>> getTasks() {
    return _db.select(_db.tasksTable).get();
  }

  Future<void> saveTask(Task task) {
    return _db.upsertIn(_db.tasksTable, task.toInsertable());
  }

  Future<void> deleteTasks(Iterable<String> tasks) {
    return (_db.delete(_db.tasksTable)..where((tbl) => tbl.id.isIn(tasks)))
        .go();
  }
}
