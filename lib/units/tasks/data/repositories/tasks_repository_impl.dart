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
    _tasksStreamController.add(localTasks);
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
    if (indexOfSavedTask == -1) {
      return;
    } else {
      final newList = [...currentList];
      newList[indexOfSavedTask] = task;
      _tasksStreamController.add(newList);
      await localService.saveTask(task);
    }
  }
}
