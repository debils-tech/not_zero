import 'package:not_zero/units/stats/services/stats_local_service.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';
import 'package:rxdart/subjects.dart';

class StatsRepository {
  StatsRepository(this._localService);

  final StatsLocalService _localService;

  Future<List<int>> getStatsByDays(DateTime start, DateTime end) async {
    final result = <int>[];

    var day = start;
    while (day.isBefore(end)) {
      final score = await _localService.getScoreSum(
        startPeriod: day.startOfDay,
        endPeriod: day.endOfDay,
      );
      result.add(score);
      day = day.dayAfter;
    }

    return result;
  }
}
