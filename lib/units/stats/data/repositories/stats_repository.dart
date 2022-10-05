import 'package:injectable/injectable.dart';
import 'package:not_zero/units/stats/data/services/stats_local_service.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:rxdart/subjects.dart';

// Needed for mapping completed tasks for counting score.
// Have to contain every importance value as key.
final _taskImportanceToScore = {
  TaskImportance.notImportant: 3,
  TaskImportance.normal: 5,
  TaskImportance.important: 8,
};

@LazySingleton(as: StatsRepository)
class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl(this.localService);

  final StatsLocalService localService;

  final _totalPointsStreamController = BehaviorSubject<int>.seeded(0);

  @override
  Stream<int> getTotalPoints() =>
      _totalPointsStreamController.asBroadcastStream();

  @override
  Future<void> countTotalPoints() async {
    final tasks = await localService.getCompletedTasksImportance();

    var result = 0;
    for (final importance in tasks) {
      result += _taskImportanceToScore[importance]!;
    }

    _totalPointsStreamController.add(result);
  }

  @override
  void includeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value += _taskImportanceToScore[importance]!;
  }

  @override
  void excludeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value -= _taskImportanceToScore[importance]!;
  }
}
