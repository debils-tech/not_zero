import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class TasksRepository {
  Stream<List<Task>> getTasks();

  Task? getTaskById(String taskId);

  Future<void> syncTasks();

  Future<void> addTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String task);

  Future<void> deleteMultipleTasks(Set<String> tasks);

  Stream<Task> subscribeOnTaskById(String taskId);

  void disposeTaskSubscription(String taskId);
}
