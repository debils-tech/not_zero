import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/helpers/async_object_wrapper.dart';
import 'package:not_zero/units/stats/models/global_stats_action.dart';
import 'package:not_zero/units/stats/models/quick_statistics_state.dart';
import 'package:not_zero/units/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero/units/stats/repositories/stats_repository.dart';
import 'package:not_zero/units/stats/services/stats_local_service.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:nz_actions/nz_actions.dart';

final statsLocalServiceProvider = Provider<StatsLocalService>((ref) {
  return StatsLocalService(
    ref.watch(databaseProvider),
  );
});

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  return StatsRepository(
    ref.watch(statsLocalServiceProvider),
  );
});

final globalStatsActionsObserver = Provider((ref) {
  return asyncRef(
    ref,
    ActionsObserver<GlobalStatsAction, GlobalStatsActionType>(
      emitters: [],
      handlers: [],
    ),
  );
});

final quickStatisticsNotifierProvider =
    NotifierProvider.autoDispose<QuickStatisticsNotifier, QuickStatisticsState>(
  QuickStatisticsNotifier.new,
);
