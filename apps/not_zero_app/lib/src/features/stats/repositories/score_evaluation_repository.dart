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
        TaskImportance.notImportant => _taskCompletedNotImportantScore,
        TaskImportance.normal => _taskCompletedNormalScore,
        TaskImportance.important => _taskCompletedImportantScore,
      };

  int evaluateTaskCreatedScore() => _taskCreatedScore;
}
