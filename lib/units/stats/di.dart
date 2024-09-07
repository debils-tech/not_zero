import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/stats/models/quick_statistics_state.dart';
import 'package:not_zero/units/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero/units/stats/repositories/stats_repository.dart';
import 'package:not_zero/units/stats/services/stats_local_service.dart';
import 'package:not_zero/units/storage/di.dart';

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

final quickStatisticsNotifierProvider =
    NotifierProvider.autoDispose<QuickStatisticsNotifier, QuickStatisticsState>(
  QuickStatisticsNotifier.new,
);
