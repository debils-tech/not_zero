import 'package:not_zero/units/stats/models/global_stats_action.dart';
import 'package:not_zero/units/tasks/models/tasks_filters.dart';
import 'package:not_zero/units/tasks/services/tasks_local_service.dart';
import 'package:nz_actions/nz_actions.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';
import 'package:rxdart/rxdart.dart';

class TasksRepository
    extends ActionsEmitter<GlobalStatsAction, GlobalStatsActionType> {
  TasksRepository(this._localService);

  final TasksLocalService _localService;

  final _tasksStreamController = BehaviorSubject<List<Task>>.seeded([]);

  @override
  void init() {}

  @override
  void dispose() {
    super.dispose();
    _tasksStreamController.close();
  }

  Stream<List<Task>> getTasks() => _tasksStreamController;

  Task? getTaskById(String taskId) {
    final currentList = _tasksStreamController.value;
    final index = currentList.indexWhere((element) => element.id == taskId);

    if (index != -1) {
      return currentList[index];
    }
    return null;
  }

  Future<void> syncTasks(TasksFilters filters) async {
    final localTasks = await _localService.getTasks(filters);
    _tasksStreamController.add(localTasks);
  }

  Future<void> addTask(Task task) {
    _tasksStreamController.add([task, ..._tasksStreamController.value]);
    return _localService.saveTask(task);
  }

  Future<void> updateTask(Task task) {
    final currentList = _tasksStreamController.value;
    final indexOfSavedTask = currentList.indexWhere((e) => e.id == task.id);

    if (indexOfSavedTask != -1) {
      final newList = [...currentList];
      newList[indexOfSavedTask] = task;

      _tasksStreamController.add(newList);
    }

    return _localService.saveTask(task);
  }

  Future<void> deleteTask(String task) {
    final newList = [..._tasksStreamController.value]
      ..removeWhere((element) => element.id == task);

    _tasksStreamController.add(newList);

    return _localService.deleteTasks([task]);
  }

  Future<void> deleteMultipleTasks(Set<String> tasks) {
    final newList = [..._tasksStreamController.value]
      ..removeWhere((element) => tasks.contains(element.id));
    _tasksStreamController.add(newList);

    return _localService.deleteTasks(tasks);
  }
}
