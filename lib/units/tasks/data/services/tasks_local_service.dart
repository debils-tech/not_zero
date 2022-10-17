import 'package:injectable/injectable.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class TasksLocalService {
  Future<List<Task>> getTasks();

  Future<void> saveTask(Task task);

  Future<void> deleteTasks(Iterable<String> tasks);
}

@LazySingleton(as: TasksLocalService)
class TasksLocalServiceImpl implements TasksLocalService {
  TasksLocalServiceImpl(StorageProvider storage) {
    _db = storage.database;
  }

  late final NotZeroDatabase _db;

  @override
  Future<List<Task>> getTasks() {
    return _db.select(_db.tasksTable).get();
  }

  @override
  Future<void> saveTask(Task task) {
    return _db.upsertIn(_db.tasksTable, task.toInsertable());
  }

  @override
  Future<void> deleteTasks(Iterable<String> tasks) {
    return (_db.delete(_db.tasksTable)..where((tbl) => tbl.id.isIn(tasks)))
        .go();
  }
}
