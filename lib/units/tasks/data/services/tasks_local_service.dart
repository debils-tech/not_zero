import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero_storage/not_zero_database.dart';

abstract class TasksLocalService {
  Future<List<Task>> getTasks();

  Future<void> saveTask(Task task);
}

@Singleton(as: TasksLocalService)
class TasksLocalServiceImpl implements TasksLocalService {
  TasksLocalServiceImpl(this.db);

  final DatabaseProvider db;

  Collection get tasksCollection => db.collections['tasks'];

  @override
  Future<List<Task>> getTasks() async {
    final tasks = await tasksCollection.find();
    return tasks.map(Task.fromJson).toList();
  }

  @override
  Future<void> saveTask(Task task) {
    return tasksCollection.insert(task.toJson());
  }
}
