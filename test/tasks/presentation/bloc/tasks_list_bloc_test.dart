import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/tasks_list_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_bloc.dart';

import '../../../global_init.dart';
import '../../tasks_db_config.dart';
import '../../template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();

  // TODO(uSlashVlad): Get rid of `Future.delayed` code.

  // Clear repository for eliminating results of previous test.
  tearDown(() async {
    getIt.resetLazySingleton<TasksRepository>();
  });

  test('Load tasks', () {
    final bloc = getIt<TasksListBloc>();
    expect(bloc.state, const TasksListState.loading());

    bloc.add(const TasksListEvent.loadTasks());
    expect(
      bloc.stream,
      emits(TasksListState.loaded(templateTasks1.reversed.toList())),
    );
  });

  test('Complete tasks', () async {
    final bloc = getIt<TasksListBloc>();

    expect(
      bloc.stream,
      emitsInOrder([
        TasksListState.loaded(templateTasks1.reversed.toList()),
        TasksListState.loaded([
          templateTasks1[2],
          templateTasks1[0].copyWith(completedAt: null),
          templateTasks1[1],
        ]),
      ]),
    );

    bloc.add(const TasksListEvent.loadTasks());
    await Future<void>.delayed(const Duration(seconds: 1));

    bloc
      ..add(
        TasksListEvent.changeTaskCompletion(
          templateTasks1[0],
          completion: false,
        ),
      )
      ..add(
        TasksListEvent.changeTaskCompletion(
          templateTasks1[1],
          completion: true,
        ),
      );

    await Future<void>.delayed(const Duration(seconds: 1));

    expect(bloc.state is TasksLoadedState, true);
    expect((bloc.state as TasksLoadedState).tasks.last.isCompleted, true);
  });

  test('Delete  tasks', () async {
    final bloc = getIt<TasksListBloc>();

    expect(
      bloc.stream,
      emitsInOrder([
        TasksListState.loaded(templateTasks1.reversed.toList()),
        TasksListState.loaded([templateTasks1[2], templateTasks1[0]]),
        TasksListState.loaded([templateTasks1[0]]),
        const TasksListState.loaded([]),
      ]),
    );

    bloc.add(const TasksListEvent.loadTasks());
    await Future<void>.delayed(const Duration(seconds: 1));

    bloc
      ..add(TasksListEvent.deleteSelected({templateTasks1[1].id}))
      ..add(TasksListEvent.deleteSelected({templateTasks1[2].id}))
      ..add(TasksListEvent.deleteSelected({templateTasks1[0].id}));
  });
}
