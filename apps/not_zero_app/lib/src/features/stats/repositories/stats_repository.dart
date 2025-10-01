import 'package:not_zero_app/src/features/stats/services/stats_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/subjects.dart';

class StatsRepository {
  StatsRepository(this._localService);

  final StatsLocalService _localService;

  final _totalPointsStreamController = BehaviorSubject<int>.seeded(-1);

  Stream<int> getTotalPoints() =>
      _totalPointsStreamController.asBroadcastStream();

  Future<void> countTotalPoints() async {
    final importances = await _localService.getCompletedTasksImportance();

    _totalPointsStreamController.add(_importancesToScore(importances));
  }

  void includeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value += _importanceToScore(importance);
  }

  void excludeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value -= _importanceToScore(importance);
  }

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
