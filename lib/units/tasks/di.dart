import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/units/stats/di.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';
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

  await repository.syncTasks();
  yield* repository.getTasks();
});

final taskStreamProvider =
    StreamProvider.autoDispose.family<Task, String>((ref, taskId) {
  final repository = ref.watch(tasksRepositoryProvider);
  ref.onDispose(() => repository.disposeTaskSubscription(taskId));
  return repository.subscribeOnTaskById(taskId);
});

// BLOC

final taskEditCubitProvider = Provider.autoDispose<TaskEditCubit>((ref) {
  return TaskEditCubit(
    ref.watch(tasksRepositoryProvider),
  );
});

final tasksSelectionBlocProvider =
    Provider.autoDispose<ItemSelectionBloc>((ref) {
  return ItemSelectionBloc();
});
