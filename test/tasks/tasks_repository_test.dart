import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import 'package:not_zero_storage/not_zero_database.dart';
import 'template_tasks.dart';

void main() {
  configureDependencies();

  final db = getIt<DatabaseProvider>();
  Collection getTasksCollection() => db.collections[LocalCollections.tasks];

  // Prepare some tasks for testing service functions.
  setUp(() async {
    await db.init();

    final collection = getTasksCollection();
    for (final t in templateTasks1) {
      await collection.insert(t.toJson());
    }
  });

  // Clear DB and repositories after every test.
  tearDown(() async {
    await db.drop();
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
        [templateTasks2.first],
        [templateTasks2[1], templateTasks2.first],
        [templateTasks2[2], templateTasks2[1], templateTasks2.first],
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
      isCompleted: false,
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
        <Task>[templateTasks1[2], templateTasks1.first],
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
}
