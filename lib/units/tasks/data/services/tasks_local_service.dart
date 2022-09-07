import 'package:injectable/injectable.dart';
import 'package:not_zero/helpers/metrics.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero_storage/not_zero_database.dart';

abstract class TasksLocalService {
  Future<List<Task>> getTasks();

  Future<void> saveTask(Task task);

  Future<void> deleteTask(String taskId);
}

@Singleton(as: TasksLocalService)
class TasksLocalServiceImpl implements TasksLocalService {
  TasksLocalServiceImpl(this.db);

  final DatabaseProvider db;

  Collection get tasksCollection => db.collections['tasks'];

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
  Future<void> deleteTask(String taskId) {
    return MetricsHelper.trackAndCapture(
      process: () {
        return tasksCollection.deleteByKey(taskId);
      },
      processName: 'deleteTask',
      operation: CustomOperations.database,
    );
  }
}
