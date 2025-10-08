import 'package:not_zero_app/src/features/stats/repositories/stats_repository.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:rxdart/rxdart.dart';

class TasksRepository {
  TasksRepository(this._localService, this._statsRepository);

  final TasksLocalService _localService;
  final StatsRepository _statsRepository;

  final _tasksStreamController = BehaviorSubject<List<Task>>.seeded([]);

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

      // Tracking if there is need to update total score or sort a list.
      final oldTask = currentList[indexOfSavedTask];

      if (oldTask.isCompleted != task.isCompleted) {
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

    return _localService.saveTask(task);
  }

  Future<void> deleteTask(String task) {
    final newList = [..._tasksStreamController.value]
      ..removeWhere((element) {
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
    final newList = [..._tasksStreamController.value]
      ..removeWhere((element) {
        if (tasks.contains(element.id)) {
          // Should exclude deleted tasks from stats
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

  Future<void> cancelMultipleTasks(
    Set<String> tasks, {
    required bool showCanceled,
  }) {
    final oldList = _tasksStreamController.value;

    final cancelList = oldList
        .where((element) => tasks.contains(element.id))
        .map((element) {
          // Should exclude canceled tasks from stats
          if (element.isCompleted) {
            _statsRepository.excludeCompletedTask(element.importance);
          }
          return element.cancel(canceled: true);
        });

    final Iterable<Task> retainList;
    if (!showCanceled) {
      // Remove canceled tasks if we they are filtered out
      retainList = oldList.where(
        (element) => !tasks.contains(element.id),
      );
    } else {
      // Just mark canceled tasks as canceled if we are showing them
      retainList = oldList.map(
        (element) => tasks.contains(element.id)
            ? element.cancel(canceled: true)
            : element,
      );
    }

    _tasksStreamController.add(retainList.toList());
    return _localService.updateTasks(cancelList);
  }
}
