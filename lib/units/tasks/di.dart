import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/units/stats/di.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_view_cubit.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_bloc.dart';

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

// BLOC

final taskEditCubitProvider = Provider.autoDispose<TaskEditCubit>((ref) {
  return TaskEditCubit(
    ref.watch(tasksRepositoryProvider),
  );
});

final taskViewCubitProvider = Provider.autoDispose<TaskViewCubit>((ref) {
  return TaskViewCubit(
    ref.watch(tasksRepositoryProvider),
  );
});

final tasksListBlocProvider = Provider.autoDispose<TasksListBloc>((ref) {
  return TasksListBloc(
    ref.watch(tasksRepositoryProvider),
  );
});

final tasksSelectionBlocProvider =
    Provider.autoDispose<ItemSelectionBloc>((ref) {
  return ItemSelectionBloc();
});
