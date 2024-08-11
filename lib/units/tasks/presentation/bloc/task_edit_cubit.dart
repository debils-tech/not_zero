import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

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
