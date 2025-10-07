import 'package:not_zero_app/src/features/stats/repositories/score_evaluation_repository.dart';
import 'package:not_zero_app/src/features/stats/services/tasks_stats_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:rxdart/subjects.dart';

class StatsRepository {
  StatsRepository(this._localService, this._scoreEvaluationRepository);

  final TasksStatsLocalService _localService;
  final ScoreEvaluationRepository _scoreEvaluationRepository;

  final _totalPointsStreamController = BehaviorSubject<int>.seeded(-1);

  Stream<int> getTotalPoints() =>
      _totalPointsStreamController.asBroadcastStream();

  Future<void> countTotalPoints() async {
    final importances = await _localService.countTaskStats();

    _totalPointsStreamController.add(
      _scoreEvaluationRepository.evaluateTasksScore(importances),
    );
  }

  void includeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value += _scoreEvaluationRepository
        .evaluateTaskImportanceScore(importance);
  }

  void excludeCompletedTask(TaskImportance importance) {
    _totalPointsStreamController.value -= _scoreEvaluationRepository
        .evaluateTaskImportanceScore(importance);
  }

  Future<List<int>> getStatsByDays(DateTime start, DateTime end) async {
    final result = <int>[];

    var day = start;
    while (day.isBefore(end)) {
      final importances = await _localService.countTaskStats(
        startPeriod: day.startOfDay,
        endPeriod: day.endOfDay,
      );
      result.add(_scoreEvaluationRepository.evaluateTasksScore(importances));
      day = day.dayAfter;
    }

    return result;
  }
}
