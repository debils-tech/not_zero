import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:not_zero_app/helpers/ref_effect_extension.dart';
import 'package:not_zero_app/units/stats/di.dart';
import 'package:not_zero_app/units/storage/di.dart';
import 'package:not_zero_app/units/tasks/models/tasks_filters.dart';
import 'package:not_zero_app/units/tasks/notifiers/tasks_filters_notifier.dart';
import 'package:not_zero_app/units/tasks/repositories/tasks_repository.dart';
import 'package:not_zero_app/units/tasks/services/tasks_local_service.dart';
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

final NotifierProvider<TasksFiltersNotifier, TasksFilters>
tasksFiltersNotifier =
    NotifierProvider.autoDispose<TasksFiltersNotifier, TasksFilters>(
      TasksFiltersNotifier.new,
    );
