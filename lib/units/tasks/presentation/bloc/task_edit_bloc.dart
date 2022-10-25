import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/task_edit_event.dart';

@injectable
class TaskEditBloc extends Bloc<TaskEditEvent, bool> {
  TaskEditBloc(this._repository) : super(false) {
    on<ChangeFormEvent>((event, emit) => emit(event.correct));
    on<SaveTaskEvent>(_saveTask);
    on<DeleteTaskEvent>(_deleteTask);
  }

  final TasksRepository _repository;

  Future<void> _saveTask(
    SaveTaskEvent event,
    Emitter<bool> _,
  ) {
    final taskToEdit = event.taskToEdit;
    if (taskToEdit == null) {
      return _repository.addTask(
        Task.create(
          title: event.title,
          description: event.description,
          importance: event.importance,
        ),
      );
    } else {
      return _repository.updateTask(
        taskToEdit.edit(
          title: event.title,
          description: event.description,
          importance: event.importance,
        ),
      );
    }
  }

  Future<void> _deleteTask(DeleteTaskEvent event, Emitter<bool> _) {
    return _repository.deleteTask(event.task.id);
  }
}
