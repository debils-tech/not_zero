import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/stats/di.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:not_zero/units/tasks/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/services/tasks_local_service.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

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

final tasksListStreamProvider =
    StreamProvider.autoDispose<List<Task>>((ref) async* {
  final repository = ref.watch(tasksRepositoryProvider);
  final tagsFilter = ref.watch(tasksListTagsFilterProvider);

  await repository.syncTasks(searchTags: tagsFilter);
  yield* repository.getTasks();
});

final specificTaskStreamProvider =
    StreamProvider.autoDispose.family<Task, String>((ref, taskId) {
  final repository = ref.watch(tasksRepositoryProvider);
  return repository
      .getTasks()
      .map((items) => items.firstWhere((task) => task.id == taskId));
});

final tasksListTagsFilterProvider = StateProvider.autoDispose<Set<String>>((ref) {
  return const {};
});

