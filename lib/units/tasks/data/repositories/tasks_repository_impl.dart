import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/data/services/tasks_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(this.localService);

  final TasksLocalService localService;

  final _tasksStreamController = BehaviorSubject<List<Task>>.seeded([]);

  @override
  Stream<List<Task>> getTasks() => _tasksStreamController.asBroadcastStream();

  @override
  Future<void> syncTasks() async {
    final localTasks = await localService.getTasks();
    _tasksStreamController.add(localTasks..sort(_tasksSorting));
  }

  @override
  Future<void> saveTask(Task task) async {
    _tasksStreamController.add([task, ..._tasksStreamController.value]);
    await localService.saveTask(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    final currentList = _tasksStreamController.value;
    final indexOfSavedTask = currentList.indexWhere((e) => e.id == task.id);
    if (indexOfSavedTask != -1) {
      final newList = [...currentList];
      newList[indexOfSavedTask] = task;

      // Sorting for ensuring that completed tasks will be at the bottom of the
      // list.
      _tasksStreamController.add(newList..sort(_tasksSorting));

      await localService.saveTask(task);
    }
  }

  @override
  Future<void> deleteTask(Task task) {
    final newList = [..._tasksStreamController.value]
      ..removeWhere((element) => element.id == task.id);
    _tasksStreamController.add(newList);

    return localService.deleteTask(task.id);
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
