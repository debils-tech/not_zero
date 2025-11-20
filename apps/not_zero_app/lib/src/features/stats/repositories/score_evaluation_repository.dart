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

import 'package:not_zero_app/src/features/stats/models/tasks_counting_data.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';

class ScoreEvaluationRepository implements BaseRepository {
  const ScoreEvaluationRepository();

  static const _taskCompletedNotImportantScore = 3;
  static const _taskCompletedNormalScore = 5;
  static const _taskCompletedImportantScore = 8;
  static const _taskCreatedScore = 1;

  int evaluateTasksScore(TasksCountingData countingData) =>
      countingData.notImportant * _taskCompletedNotImportantScore +
      countingData.normal * _taskCompletedNormalScore +
      countingData.important * _taskCompletedImportantScore +
      countingData.created * _taskCreatedScore;

  int evaluateTaskImportanceScore(TaskImportance importance) =>
      switch (importance) {
        .notImportant => _taskCompletedNotImportantScore,
        .normal => _taskCompletedNormalScore,
        .important => _taskCompletedImportantScore,
      };

  int evaluateTaskCreatedScore() => _taskCreatedScore;
}
