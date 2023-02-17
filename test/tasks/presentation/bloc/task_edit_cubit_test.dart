import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero/units/tasks/presentation/bloc/task_edit_cubit.dart';

import '../../../global_init.dart';
import '../../tasks_db_config.dart';
import '../../template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();

  test('Form changes', () {
    final cubit = getIt<TaskEditCubit>();
    expect(cubit.state, false);

    expect(cubit.stream, emitsInOrder([true, false]));

    cubit.changeForm(isCorrect: true);
    cubit.changeForm(isCorrect: false);
  });

  test('Save new task', () async {
    final cubit = getIt<TaskEditCubit>();
    final repository = getIt<TasksRepository>();

    await repository.syncTasks();
    await cubit.saveTask(
      importance: TaskImportance.important,
      title: 'New task!',
      description: 'New description',
    );

    final tasks = await repository.getTasks().first;
    final newTask = tasks.first;
    expect(newTask.importance, TaskImportance.important);
    expect(newTask.title, 'New task!');
    expect(newTask.description, 'New description');
  });

  test('Update existing task', () async {
    final cubit = getIt<TaskEditCubit>();
    final repository = getIt<TasksRepository>();

    final taskToEdit = templateTasks1.first;

    await repository.syncTasks();
    await cubit.saveTask(
      importance: TaskImportance.important,
      title: 'Updated task',
      taskToEdit: taskToEdit,
    );

    final task = repository.getTaskById(taskToEdit.id);
    expect(task, isNotNull);
    expect(task!.modifiedAt, isNotNull);
    expect(task.importance, TaskImportance.important);
    expect(task.title, 'Updated task');
  });

  test('Delete task', () async {
    final cubit = getIt<TaskEditCubit>();
    final repository = getIt<TasksRepository>();

    await repository.syncTasks();
    await cubit.deleteTask(templateTasks1[1]);

    await expectLater(
      repository.getTasks(),
      emits([templateTasks1[2], templateTasks1[0]]),
    );
  });
}
