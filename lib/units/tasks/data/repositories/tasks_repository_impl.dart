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
    if (_tasksStreamController.value.isEmpty) {
      _tasksStreamController.add(localTasks);
    } else {
      _tasksStreamController
          .add([..._tasksStreamController.value, ...localTasks]);
    }
  }

  @override
  Future<void> saveTask(Task task) async {
    _tasksStreamController.add([task, ..._tasksStreamController.value]);
    await localService.saveTask(task);
  }
}
