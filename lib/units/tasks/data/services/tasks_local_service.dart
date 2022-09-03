import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero_storage/not_zero_database.dart';

abstract class TasksLocalService {
  Future<List<Task>> getTasks();
}

@Singleton(as: TasksLocalService)
class TasksLocalServiceImpl implements TasksLocalService {
  TasksLocalServiceImpl(this.db);

  final DatabaseProvider db;

  @override
  Future<List<Task>> getTasks() async {
    return [];
  }
}
