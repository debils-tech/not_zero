import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/task_edit_event.dart';

@injectable
class TaskEditBloc extends Bloc<TaskEditEvent, bool> {
  TaskEditBloc(this._repository) : super(false) {
    on<ChangeFormEvent>((event, emit) => emit(event.correct));
    on<SaveTaskEvent>(_saveTask);
  }

  final TasksRepository _repository;

  Future<void> _saveTask(
    SaveTaskEvent event,
    Emitter<bool> _,
  ) =>
      _repository.saveTask(
        Task.create(
          title: event.title,
          description: event.description,
          importance: event.importance,
        ),
      );
}
