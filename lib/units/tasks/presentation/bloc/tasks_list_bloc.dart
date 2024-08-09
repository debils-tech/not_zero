import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

part 'tasks_list_bloc.freezed.dart';
part 'tasks_list_event.dart';
part 'tasks_list_state.dart';

@injectable
class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  TasksListBloc(this._repository) : super(const TasksListState.loading()) {
    on<_LoadTasksEvent>(_onLoadTasks);
    on<_ChangeTaskCompletionEvent>(_onChangeTaskCompletion);
    on<_DeleteSelectedTasksEvent>(_onDeleteSelectedTasks);
  }

  final TasksRepository _repository;

  Future<void> _onLoadTasks(
    _LoadTasksEvent event,
    Emitter<TasksListState> emit,
  ) async {
    await _repository.syncTasks();

    await emit.forEach<List<Task>>(
      _repository.getTasks(),
      onData: TasksListState.loaded,
    );
  }

  Future<void> _onChangeTaskCompletion(
    _ChangeTaskCompletionEvent event,
    Emitter<TasksListState> _,
  ) {
    return _repository.updateTask(
      event.task.complete(completed: event.completion),
    );
  }

  Future<void> _onDeleteSelectedTasks(
    _DeleteSelectedTasksEvent event,
    Emitter<TasksListState> _,
  ) {
    return _repository.deleteMultipleTasks(event.tasks);
  }
}
