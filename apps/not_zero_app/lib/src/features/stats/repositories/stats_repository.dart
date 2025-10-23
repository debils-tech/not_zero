import 'package:not_zero_app/src/features/stats/repositories/score_evaluation_repository.dart';
import 'package:not_zero_app/src/features/stats/services/tasks_stats_local_service.dart';
import 'package:nz_common/nz_common.dart';

class StatsRepository implements BaseRepository {
  const StatsRepository(this._localService, this._scoreEvaluationRepository);

  final TasksStatsLocalService _localService;
  final ScoreEvaluationRepository _scoreEvaluationRepository;

  Future<int> countTotalPoints() async {
    final importances = await _localService.countTaskStats();
    return _scoreEvaluationRepository.evaluateTasksScore(importances);
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
