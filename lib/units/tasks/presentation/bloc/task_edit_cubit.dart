import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';

@injectable
class TaskEditCubit extends Cubit<bool> {
  TaskEditCubit(this._repository) : super(false);

  final TasksRepository _repository;

  bool isChanged = false;

  void changeForm({required bool isCorrect}) {
    isChanged = true;
    if (isCorrect != state) {
      emit(isCorrect);
    }
  }

  Future<void> saveTask({
    required TaskImportance importance,
    required String title,
    String? description,
    List<ItemTag>? tags,
    Task? taskToEdit,
  }) {
    if (taskToEdit == null) {
      return _repository.addTask(
        Task.create(
          title: title,
          description: description,
          importance: importance,
          tags: tags,
        ),
      );
    }

    return _repository.updateTask(
      taskToEdit.edit(
        title: title,
        description: description,
        importance: importance,
        tags: tags,
      ),
    );
  }

  Future<void> deleteTask(Task task) {
    return _repository.deleteTask(task.id);
  }
}
