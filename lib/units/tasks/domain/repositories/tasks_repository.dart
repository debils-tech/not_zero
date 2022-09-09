import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class TasksRepository {
  Stream<List<Task>> getTasks();

  Future<void> syncTasks();

  Future<void> saveTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String task);

  Future<void> deleteMultipleTasks(Set<String> tasks);
}
