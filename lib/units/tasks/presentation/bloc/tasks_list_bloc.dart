import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/tasks_list_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';

@injectable
class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  TasksListBloc(this._repository) : super(const TasksListState.loading()) {
    on<LoadTasksEvent>(_onLoadTasks);
  }

  final TasksRepository _repository;

  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TasksListState> emit,
  ) async {
    await _repository.syncTasks();

    await emit.forEach<List<Task>>(
      _repository.getTasks(),
      onData: (tasks) {
        return TasksListState.loaded(tasks);
      },
    );
  }
}
