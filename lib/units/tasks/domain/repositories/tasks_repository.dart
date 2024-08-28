import 'package:not_zero/units/stats/repositories/stats_repository.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';
import 'package:rxdart/rxdart.dart';

class TasksRepository {
  TasksRepository(this._localService, this._statsRepository);

  final TasksLocalService _localService;
  final StatsRepository _statsRepository;

  final _tasksStreamController = BehaviorSubject<List<Task>>.seeded([]);

  final _subscribedTasks = <String, BehaviorSubject<Task>>{};

  Stream<List<Task>> getTasks() => _tasksStreamController;

  Task? getTaskById(String taskId) {
    final currentList = _tasksStreamController.value;
    final index = currentList.indexWhere((element) => element.id == taskId);

    if (index != -1) {
      return currentList[index];
    }
    return null;
  }

  Future<void> syncTasks() async {
    final localTasks = await _localService.getTasks();
    _tasksStreamController.add(localTasks..sort(_tasksSorting));
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

      // Tracking if there is need to update total score or sort a list.
      final oldTask = currentList[indexOfSavedTask];

      if (oldTask.isCompleted != task.isCompleted) {
        // Sorting for ensuring that completed tasks will be at the bottom of
        // the list.
        newList.sort(_tasksSorting);

        if (task.isCompleted) {
          _statsRepository.includeCompletedTask(task.importance);
        } else {
          _statsRepository.excludeCompletedTask(task.importance);
        }
      } else if (oldTask.importance != task.importance && task.isCompleted) {
        _statsRepository
          ..excludeCompletedTask(oldTask.importance)
          ..includeCompletedTask(task.importance);
      }

      _tasksStreamController.add(newList);
    }

    final taskSub = _subscribedTasks[task.id];
    if (taskSub != null) {
      taskSub.add(task);
    }

    return _localService.saveTask(task);
  }

  Future<void> deleteTask(String task) {
    final newList = [..._tasksStreamController.value]..removeWhere((element) {
        if (element.id == task) {
          if (element.isCompleted) {
            _statsRepository.excludeCompletedTask(element.importance);
          }
          return true;
        }
        return false;
      });

    _tasksStreamController.add(newList);

    return _localService.deleteTasks([task]);
  }

  Future<void> deleteMultipleTasks(Set<String> tasks) {
    final newList = [..._tasksStreamController.value]..removeWhere((element) {
        if (tasks.contains(element.id)) {
          if (element.isCompleted) {
            _statsRepository.excludeCompletedTask(element.importance);
          }
          return true;
        }
        return false;
      });
    _tasksStreamController.add(newList);

    return _localService.deleteTasks(tasks);
  }

  int _tasksSorting(Task a, Task b) {
    return b.compareTo(a);
  }

  Stream<Task> subscribeOnTaskById(String taskId) {
    // Trying to find already created subscription.
    var taskStream = _subscribedTasks[taskId];
    if (taskStream != null) return taskStream;

    // Creating a new one if such subscription doesn't exist.
    taskStream = BehaviorSubject<Task>();
    _subscribedTasks[taskId] = taskStream;
    return taskStream;
  }

  bool disposeTaskSubscription(String taskId) {
    final taskStream = _subscribedTasks[taskId];
    if (taskStream == null) return false;

    taskStream.close();
    _subscribedTasks.remove(taskId);
    return true;
  }
}
