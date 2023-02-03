import 'package:not_zero/units/tasks/domain/models/task.dart';

abstract class StatsRepository {
  Stream<int> getTotalPoints();

  Future<void> countTotalPoints();

  void includeCompletedTask(TaskImportance importance);

  void excludeCompletedTask(TaskImportance importance);

  Future<List<int>> getStatsForWeek([int offsetFromCurrent]);
}
