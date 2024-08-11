import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/stats/data/stats_local_service.dart';
import 'package:not_zero/units/stats/domain/repositories/stats_repository.dart';
import 'package:not_zero/units/stats/presentation/bloc/quick_statistics_cubit.dart';
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

// BLOC

final quickStatisticsCubitProvider =
    Provider.autoDispose<QuickStatisticsCubit>((ref) {
  return QuickStatisticsCubit(
    ref.watch(statsRepositoryProvider),
  );
});
