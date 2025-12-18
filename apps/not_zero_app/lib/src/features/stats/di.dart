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
import 'package:not_zero_app/src/features/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero_app/src/features/stats/notifiers/total_score_notifier.dart';
import 'package:not_zero_app/src/features/stats/repositories/score_evaluation_repository.dart';
import 'package:not_zero_app/src/features/stats/repositories/stats_repository.dart';
import 'package:not_zero_app/src/features/stats/services/check_in_stats_local_service.dart';
import 'package:not_zero_app/src/features/stats/services/habits_stats_local_service.dart';
import 'package:not_zero_app/src/features/stats/services/tasks_stats_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';

final tasksStatsLocalServiceProvider = Provider<TasksStatsLocalService>((ref) {
  return TasksStatsLocalService(
    ref.watch(databaseProvider),
  );
});

final habitsStatsLocalServiceProvider = Provider<HabitsStatsLocalService>((
  ref,
) {
  return HabitsStatsLocalService(
    ref.watch(databaseProvider),
  );
});

final checkInStatsLocalServiceProvider = Provider<CheckInStatsLocalService>((
  ref,
) {
  return CheckInStatsLocalService(
    ref.watch(databaseProvider),
  );
});

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository(
    ref.watch(tasksStatsLocalServiceProvider),
    ref.watch(habitsStatsLocalServiceProvider),
    ref.watch(checkInStatsLocalServiceProvider),
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
