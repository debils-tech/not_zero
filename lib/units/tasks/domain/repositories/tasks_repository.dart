import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class TasksRepository {
  Stream<List<Task>> loadTasks();
}
