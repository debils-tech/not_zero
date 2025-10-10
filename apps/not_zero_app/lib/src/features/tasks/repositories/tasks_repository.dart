import 'package:not_zero_app/src/features/stats/repositories/stats_repository.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TasksRepository {
  const TasksRepository(this._localService, this._statsRepository);

  final TasksLocalService _localService;
  final StatsRepository _statsRepository;

  Future<List<Task>> getTasks(TasksFilters filters) {
    return _localService.getTasks(filters);
  }

  Future<void> addTask(Task task) {
    return _localService.saveTask(task);
  }

  Future<void> updateTask(Task task, {Task? oldTask}) {
    if (oldTask != null) {
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
    }

    return _localService.saveTask(task);
  }

  Future<void> deleteTask(Task task) {
    _statsRepository.excludeCompletedTask(task.importance);

    return _localService.deleteTasks([task.id]);
  }

  Future<void> deleteMultipleTasks(Iterable<Task> tasks) {
    for (final task in tasks) {
      _statsRepository.excludeCompletedTask(task.importance);
    }

    return _localService.deleteTasks(tasks.map((t) => t.id));
  }

  Future<void> cancelMultipleTasks(Iterable<Task> tasks) {
    // Can't cancel completed tasks so no need for that now
    // for (final task in tasks) {
    //   _statsRepository.excludeCompletedTask(task.importance);
    // }

    return _localService.updateTasks(tasks);
  }
}
