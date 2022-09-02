import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class TasksLocalLoadingService {
  Future<List<Task>> getTasks();
}
