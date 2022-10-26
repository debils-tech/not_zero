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
    on<ChangeTaskCompletionEvent>(_onChangeTaskCompletion);
    on<DeleteSelectedTasksEvent>(_onDeleteSelectedTasks);
  }

  final TasksRepository _repository;

  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TasksListState> emit,
  ) async {
    await _repository.syncTasks();

    await emit.forEach<List<Task>>(
      _repository.getTasks(),
      onData: TasksListState.loaded,
    );
  }

  Future<void> _onChangeTaskCompletion(
    ChangeTaskCompletionEvent event,
    Emitter<TasksListState> _,
  ) {
    return _repository.updateTask(
      event.task.complete(completed: event.completion),
    );
  }

  Future<void> _onDeleteSelectedTasks(
    DeleteSelectedTasksEvent event,
    Emitter<TasksListState> _,
  ) {
    return _repository.deleteMultipleTasks(event.tasks);
  }
}
