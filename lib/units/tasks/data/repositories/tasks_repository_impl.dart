import 'package:injectable/injectable.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/tasks/data/services/tasks_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(this._localService, this._statsRepository);

  final TasksLocalService _localService;
  final StatsRepository _statsRepository;

  final _tasksStreamController = BehaviorSubject<List<Task>>.seeded([]);

  @override
  Stream<List<Task>> getTasks() => _tasksStreamController.asBroadcastStream();

  @override
  Future<void> syncTasks() async {
    // TODO(uSlashVlad): Refactor this code to eliminate unnecessary var.
    final localTasks = await _localService.getTasks();
    _tasksStreamController.add(localTasks..sort(_tasksSorting));
  }

  @override
  Future<void> saveTask(Task task) async {
    _tasksStreamController.add([task, ..._tasksStreamController.value]);
    await _localService.saveTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    final currentList = _tasksStreamController.value;
    final indexOfSavedTask = currentList.indexWhere((e) => e.id == task.id);

    if (indexOfSavedTask != -1) {
      final newList = [...currentList];

      // Tracking if there is need to update total score.
      final oldTask = newList[indexOfSavedTask];

      newList[indexOfSavedTask] = task;

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

      return _localService.saveTask(task);
    }
  }

  @override
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

  @override
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
    if (a.isCompleted && !b.isCompleted) {
      return 1;
    } else if (!a.isCompleted && b.isCompleted) {
      return -1;
    } else {
      return b.createdAt.compareTo(a.createdAt);
    }
  }
}
