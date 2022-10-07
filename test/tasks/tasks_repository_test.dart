import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'tasks_db_config.dart';
import 'template_tasks.dart';

void main() {
  configureDependencies();
  configDatabaseForTasks();

  // Clear repository for eliminating results of previous test.
  tearDown(() async {
    getIt.resetLazySingleton<TasksRepository>();
  });

  test('Sync tasks', () async {
    final repository = getIt<TasksRepository>();

    expect(
      repository.getTasks(),
      emitsInOrder([
        <Task>[],
        templateTasks1.reversed.toList(),
      ]),
    );

    await repository.syncTasks();
  });

  test('Save tasks', () async {
    final repository = getIt<TasksRepository>();

    expect(
      repository.getTasks(),
      emitsInOrder([
        <Task>[],
        [templateTasks2[0]],
        [templateTasks2[1], templateTasks2[0]],
        [templateTasks2[2], templateTasks2[1], templateTasks2[0]],
      ]),
    );

    for (final t in templateTasks2) {
      await repository.saveTask(t);
    }
  });

  test('Update task + sync', () async {
    final repository = getIt<TasksRepository>();

    final editedTask = templateTasks1.first.copyWith(
      title: 'Edited task 1',
      description: '(edited)',
      completedAt: DateTime.fromMillisecondsSinceEpoch(1664392368),
    );

    expect(
      repository.getTasks(),
      emitsInOrder([
        <Task>[],
        templateTasks1.reversed.toList(),
        <Task>[templateTasks1[2], templateTasks1[1], editedTask],
      ]),
    );

    await repository.syncTasks();
    await repository.updateTask(editedTask);
  });

  test('Delete task + sync', () async {
    final repository = getIt<TasksRepository>();

    expect(
      repository.getTasks(),
      emitsInOrder([
        <Task>[],
        templateTasks1.reversed.toList(),
        <Task>[templateTasks1[2], templateTasks1[0]],
      ]),
    );

    await repository.syncTasks();
    await repository.deleteTask(templateTasks1[1].id);
  });

  test('Delete multiple tasks + sync', () async {
    final repository = getIt<TasksRepository>();

    expect(
      repository.getTasks(),
      emitsInOrder([
        <Task>[],
        templateTasks1.reversed.toList(),
        <Task>[templateTasks1.first],
      ]),
    );

    await repository.syncTasks();
    await repository.deleteMultipleTasks({
      templateTasks1[2].id,
      templateTasks1[1].id,
    });
  });

  // TODO(uSlashVlad): There also should be test for checking task completion
  // and correct ordering.
}
