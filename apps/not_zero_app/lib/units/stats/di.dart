import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/units/stats/models/quick_statistics_state.dart';
import 'package:not_zero_app/units/stats/notifiers/quick_statistics_notifier.dart';
import 'package:not_zero_app/units/stats/repositories/stats_repository.dart';
import 'package:not_zero_app/units/stats/services/stats_local_service.dart';
import 'package:not_zero_app/units/storage/di.dart';

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

final NotifierProvider<QuickStatisticsNotifier, QuickStatisticsState>
quickStatisticsNotifierProvider =
    NotifierProvider.autoDispose<QuickStatisticsNotifier, QuickStatisticsState>(
      QuickStatisticsNotifier.new,
    );
