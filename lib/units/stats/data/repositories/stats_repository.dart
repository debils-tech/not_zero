import 'package:injectable/injectable.dart';
import 'package:not_zero/units/stats/data/services/stats_local_service.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:rxdart/subjects.dart';

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
      switch (importance) {
        case TaskImportance.notImportant:
          result += 3;
          break;
        case TaskImportance.normal:
          result += 5;
          break;
        case TaskImportance.important:
          result += 8;
          break;
      }
    }

    _totalPointsStreamController.add(result);
  }
}
