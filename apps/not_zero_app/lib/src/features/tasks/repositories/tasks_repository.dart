import 'package:not_zero_app/src/features/tasks/models/task_action.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:nz_actions_bus/nz_actions_bus.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class TasksRepository implements BaseRepository {
  const TasksRepository(this._localService, this._actionsBus);

  final TasksLocalService _localService;
  final ActionsBus _actionsBus;

  Future<List<Task>> getTasks(TasksFilters filters) {
    return _localService.getTasks(filters);
  }

  Future<void> addTask(Task task) async {
    _actionsBus.emit(TaskAction.created(task: task));
    return _localService.saveTask(task);
  }

  Future<void> updateTask({
    required Task oldTask,
    required Task newTask,
  }) async {
    _actionsBus.emit(TaskAction.updated(oldTask: oldTask, newTask: newTask));

    return _localService.saveTask(newTask);
  }

  Future<void> deleteTask(Task task) async {
    _actionsBus.emit(TaskAction.deleted(tasks: [task]));

    return _localService.deleteTasks([task.id]);
  }

  Future<void> deleteMultipleTasks(Iterable<Task> tasks) async {
    _actionsBus.emit(TaskAction.deleted(tasks: tasks));

    return _localService.deleteTasks(tasks.map((t) => t.id));
  }

  Future<void> cancelMultipleTasks(Iterable<Task> tasks) {
    return _localService.updateTasks(tasks);
  }
}
