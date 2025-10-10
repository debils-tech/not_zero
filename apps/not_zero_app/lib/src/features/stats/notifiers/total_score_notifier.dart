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
