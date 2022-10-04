import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero_storage/not_zero_database.dart';
import 'package:sembast/sembast.dart';

abstract class StatsLocalService {
  Future<List<TaskImportance>> getCompletedTasksImportance();
}

@Singleton(as: StatsLocalService)
class StatsLocalServiceImpl implements StatsLocalService {
  StatsLocalServiceImpl(this.db);

  final DatabaseProvider db;

  Collection get tasksCollection => db.collections[LocalCollections.tasks];

  @override
  Future<List<TaskImportance>> getCompletedTasksImportance() async {
    final rawCompletedTasks = await tasksCollection.find(
      finder: Finder(filter: Filter.notNull('completedAt')),
    );

    return rawCompletedTasks.map((e) => Task.fromJson(e).importance).toList();
  }
}
