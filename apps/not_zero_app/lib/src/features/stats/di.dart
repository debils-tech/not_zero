import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero_app/src/features/stats/notifiers/total_score_notifier.dart';
import 'package:not_zero_app/src/features/stats/repositories/score_evaluation_repository.dart';
import 'package:not_zero_app/src/features/stats/repositories/stats_repository.dart';
import 'package:not_zero_app/src/features/stats/services/tasks_stats_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';

final tasksStatsLocalServiceProvider = Provider<TasksStatsLocalService>((ref) {
  return TasksStatsLocalService(
    ref.watch(databaseProvider),
  );
});

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository(
    ref.watch(tasksStatsLocalServiceProvider),
    ref.watch(scoreEvaluationRepositoryProvider),
  );
});

final scoreEvaluationRepositoryProvider = Provider<ScoreEvaluationRepository>((
  ref,
) {
  return const ScoreEvaluationRepository();
});

final totalScoreNotifierProvider =
    AsyncNotifierProvider.autoDispose<TotalScoreNotifier, int>(
      TotalScoreNotifier.new,
    );

final quickStatisticsNotifierProvider = NotifierProvider.autoDispose(
  QuickStatisticsNotifier.new,
);
