import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero_app/src/features/stats/repositories/score_evaluation_repository.dart';
import 'package:not_zero_app/src/features/stats/repositories/stats_repository.dart';
import 'package:not_zero_app/src/features/stats/services/tasks_stats_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/helpers/ref_living_extension.dart';

final tasksStatsLocalServiceProvider = Provider<TasksStatsLocalService>((ref) {
  return TasksStatsLocalService(
    ref.watch(databaseProvider),
  );
});

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return ref.living(
    StatsRepository(
      ref.watch(tasksStatsLocalServiceProvider),
      ref.watch(scoreEvaluationRepositoryProvider),
    ),
  );
});

final scoreEvaluationRepositoryProvider = Provider<ScoreEvaluationRepository>((
  ref,
) {
  return const ScoreEvaluationRepository();
});

final quickStatisticsNotifierProvider = NotifierProvider.autoDispose(
  QuickStatisticsNotifier.new,
);
