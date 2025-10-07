import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/features/tasks/notifiers/tasks_filters_notifier.dart';
import 'package:not_zero_app/src/features/tasks/repositories/tasks_repository.dart';
import 'package:not_zero_app/src/features/tasks/services/tasks_local_service.dart';
import 'package:not_zero_app/src/helpers/ref_effect_extension.dart';
import 'package:nz_base_models/nz_base_models.dart';

final tasksLocalServiceProvider = Provider<TasksLocalService>((ref) {
  return TasksLocalService(
    ref.watch(databaseProvider),
  );
});

final tasksRepositoryProvider = Provider<TasksRepository>((ref) {
  return TasksRepository(
    ref.watch(tasksLocalServiceProvider),
    ref.watch(statsRepositoryProvider),
  );
});

final StreamProvider<List<Task>> tasksListStreamProvider =
    StreamProvider.autoDispose<List<Task>>((
      ref,
    ) async* {
      final repository = ref.watch(tasksRepositoryProvider);

      // Updating tasks list when filters are changed
      ref.effect(
        tasksFiltersNotifier,
        repository.syncTasks,
      );

      yield* repository.getTasks();
    });

final StreamProviderFamily<Task, String> specificTaskStreamProvider =
    StreamProvider.autoDispose.family<Task, String>((ref, taskId) {
      final repository = ref.watch(tasksRepositoryProvider);
      return repository.getTasks().map(
        (items) => items.firstWhere((task) => task.id == taskId),
      );
    });

final tasksFiltersNotifier = NotifierProvider.autoDispose(
  TasksFiltersNotifier.new,
);
