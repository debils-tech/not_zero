import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/habits/notifiers/habits_list_notifier.dart';
import 'package:not_zero_app/src/features/habits/repositories/habits_repository.dart';
import 'package:not_zero_app/src/features/habits/services/habits_local_service.dart';
import 'package:not_zero_app/src/features/storage/di.dart';

final habitsLocalServiceProvider = Provider<HabitsLocalService>((ref) {
  return HabitsLocalService(
    ref.watch(databaseProvider),
  );
});

final habitsRepositoryProvider = Provider<HabitsRepository>((ref) {
  return HabitsRepository(
    ref.watch(habitsLocalServiceProvider),
  );
});

final habitsListNotifierProvider = AsyncNotifierProvider.autoDispose(
  HabitsListNotifier.new,
);
