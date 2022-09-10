import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/helpers/metrics.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero_storage/not_zero_database.dart';

abstract class TasksLocalService {
  Future<List<Task>> getTasks();

  Future<void> saveTask(Task task);

  Future<void> deleteTasks(Iterable<String> tasks);
}

@Singleton(as: TasksLocalService)
class TasksLocalServiceImpl implements TasksLocalService {
  TasksLocalServiceImpl(this.db);

  final DatabaseProvider db;

  Collection get tasksCollection => db.collections[LocalCollections.tasks];

  @override
  Future<List<Task>> getTasks() {
    return MetricsHelper.trackAndCapture(
      process: () async {
        final tasks = await tasksCollection.find();

        return tasks.map(Task.fromJson).toList();
      },
      processName: 'getTasks',
      operation: CustomOperations.database,
    );
  }

  @override
  Future<void> saveTask(Task task) {
    return MetricsHelper.trackAndCapture(
      process: () {
        return tasksCollection.insert(task.toJson());
      },
      processName: 'saveTask',
      operation: CustomOperations.database,
    );
  }

  @override
  Future<void> deleteTasks(Iterable<String> tasks) {
    return MetricsHelper.trackAndCapture(
      process: () async {
        // TODO(uSlashVlad): Add "deleteByKeys" method in collections.
        for (final task in tasks) {
          await tasksCollection.deleteByKey(task);
        }
      },
      processName: 'deleteTask',
      operation: CustomOperations.database,
    );
  }
}
