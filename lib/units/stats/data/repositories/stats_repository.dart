import 'package:injectable/injectable.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/stats/data/services/stats_local_service.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:rxdart/subjects.dart';

@LazySingleton(as: StatsRepository)
class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl(this._localService);

  final StatsLocalService _localService;

  final _totalPointsStreamController = BehaviorSubject<int>.seeded(-1);

  @override
  Stream<int> getTotalPoints() =>
      _totalPointsStreamController.asBroadcastStream();

  @override
  Future<void> countTotalPoints() async {
    final importances = await _localService.getCompletedTasksImportance();

    _totalPointsStreamController.add(_importancesToScore(importances));
  }

  @override
  void includeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value += _importanceToScore(importance);
  }

  @override
  void excludeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value -= _importanceToScore(importance);
  }

  @override
  Future<List<int>> getStatsByDays(DateTime start, DateTime end) async {
    final result = <int>[];

    var day = start;
    while (day.isBefore(end)) {
      final importances = await _localService.getCompletedTasksImportance(
        startPeriod: day.startOfDay,
        endPeriod: day.endOfDay,
      );
      result.add(_importancesToScore(importances));
      day = day.dayAfter;
    }

    return result;
  }

  int _importancesToScore(List<TaskImportance> importances) {
    return importances.fold(
      0,
      (previousValue, element) => previousValue + _importanceToScore(element),
    );
  }

  int _importanceToScore(TaskImportance importance) {
    switch (importance) {
      case TaskImportance.notImportant:
        return 3;
      case TaskImportance.normal:
        return 5;
      case TaskImportance.important:
        return 8;
    }
  }
}
