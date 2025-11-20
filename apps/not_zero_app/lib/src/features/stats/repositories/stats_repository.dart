// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
