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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/features/tasks/models/task_action.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';

class TotalScoreNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() async {
    ref.listenActions<TaskAction>(_handleTaskAction);

    return _countTotalPoints();
  }

  Future<int> _countTotalPoints() async {
    final statsRepository = ref.watch(statsRepositoryProvider);
    return statsRepository.countTotalPoints();
  }

  void _handleTaskAction(TaskAction action) {
    if (!state.hasValue) return;

    final currentPoints = state.value!;
    final scoreEvaluation = ref.read(scoreEvaluationRepositoryProvider);
    var newPoints = currentPoints;

    switch (action) {
      case TaskActionUpdated(:final oldTask, :final newTask):
        if (oldTask.isCompleted != newTask.isCompleted) {
          if (newTask.isCompleted) {
            // notCompleted -> completed
            newPoints += scoreEvaluation.evaluateTaskImportanceScore(
              newTask.importance,
            );
          } else {
            // completed -> notCompleted
            newPoints -= scoreEvaluation.evaluateTaskImportanceScore(
              oldTask.importance,
            );
          }
        } else if (oldTask.importance != newTask.importance &&
            newTask.isCompleted) {
          // importance changed and task is completed
          newPoints -= scoreEvaluation.evaluateTaskImportanceScore(
            oldTask.importance,
          );
          newPoints += scoreEvaluation.evaluateTaskImportanceScore(
            newTask.importance,
          );
        }

      case TaskActionDeletedMultiple(tasks: final deletedTasks):
        for (final task in deletedTasks) {
          if (task.isCompleted) {
            newPoints -= scoreEvaluation.evaluateTaskImportanceScore(
              task.importance,
            );
          }
          newPoints -= scoreEvaluation.evaluateTaskCreatedScore();
        }

      case TaskActionCreated():
        newPoints += scoreEvaluation.evaluateTaskCreatedScore();
    }

    if (newPoints != currentPoints) {
      state = AsyncValue.data(newPoints);
    }
  }
}
