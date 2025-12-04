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

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/habits/models/habit_action.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/features/tasks/models/task_action.dart';
import 'package:not_zero_app/src/helpers/ref_actions_extension.dart';

class TotalScoreNotifier extends AsyncNotifier<int> {
  @override
  Future<int> build() async {
    ref.listenActions<TaskAction>(_handleTaskAction);
    ref.listenActions<HabitAction>(_handleHabitAction);

    return _countTotalPoints();
  }

  Future<int> _countTotalPoints() async {
    final statsRepository = ref.watch(statsRepositoryProvider);
    return statsRepository.countTotalPoints();
  }

  void _handleTaskAction(TaskAction action) {
    final currentPoints = state.value;
    if (currentPoints == null) return;

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

  void _handleHabitAction(HabitAction action) {
    final currentPoints = state.value;
    if (currentPoints == null) return;

    final scoreEvaluation = ref.read(scoreEvaluationRepositoryProvider);
    var newPoints = currentPoints;

    switch (action) {
      case HabitActionUpdated(:final oldHabit, :final newHabit):
        if (oldHabit.importance != newHabit.importance) {
          unawaited(
            _countTotalPoints().then((value) => state = AsyncValue.data(value)),
          );
        }

      case HabitActionDeletedMultiple() ||
          HabitActionCompleted() ||
          HabitActionNotCompleted():
        // FIXME(uslashvlad): Try not to recalculate total points
        // every time habit completed
        unawaited(
          _countTotalPoints().then((value) => state = AsyncValue.data(value)),
        );

      case HabitActionCreated():
        newPoints += scoreEvaluation.evaluateTaskCreatedScore();

      // case HabitActionCompleted(:final habit):
      //   newPoints += scoreEvaluation
      //       .evaluateHabitScore(
      //         habit.importance,
      //         habit.regularity,
      //       )
      //       .round();

      // case HabitActionNotCompleted(:final habit):
      //   newPoints -= scoreEvaluation
      //       .evaluateHabitScore(
      //         habit.importance,
      //         habit.regularity,
      //       )
      //       .round();
    }

    if (newPoints != currentPoints) {
      state = AsyncValue.data(newPoints);
    }
  }
}
