import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
import '../../../global_init.dart';
import '../../tasks_db_config.dart';
import '../../template_tasks.dart';

void main() {
  globalInit();
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

  group('Save, update, delete of tasks', () {
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
        await repository.addTask(t);
      }
    });

    test('Update task + sync', () async {
      final repository = getIt<TasksRepository>();

      final editedTask = templateTasks1.first.copyWith(
        title: 'Edited task 1',
        description: '(edited)',
        completedAt: DateTime.fromMillisecondsSinceEpoch(1664392368),
      );

      await repository.syncTasks();

      expect(
        repository.getTasks(),
        emitsInOrder([
          templateTasks1.reversed.toList(),
          <Task>[templateTasks1[2], templateTasks1[1], editedTask],
        ]),
      );

      await repository.updateTask(editedTask);
    });

    test('Delete task + sync', () async {
      final repository = getIt<TasksRepository>();

      await repository.syncTasks();

      expect(
        repository.getTasks(),
        emitsInOrder([
          templateTasks1.reversed.toList(),
          <Task>[templateTasks1[2], templateTasks1[0]],
        ]),
      );

      await repository.deleteTask(templateTasks1[1].id);
    });

    test('Delete multiple tasks + sync', () async {
      final repository = getIt<TasksRepository>();

      await repository.syncTasks();

      expect(
        repository.getTasks(),
        emitsInOrder([
          templateTasks1.reversed.toList(),
          <Task>[templateTasks1.first],
        ]),
      );

      await repository.deleteMultipleTasks({
        templateTasks1[2].id,
        templateTasks1[1].id,
      });
    });
  });

  test('Full cycle and ordering', () async {
    final repository = getIt<TasksRepository>();

    final newTask = templateTasks2[1].copyWith(
      createdAt: DateTime.fromMillisecondsSinceEpoch(1665168245000),
    );

    final completedTask = newTask.copyWith(
      completedAt: DateTime.fromMillisecondsSinceEpoch(1665168265000),
    );

    await repository.syncTasks();

    expect(
      repository.getTasks(),
      emitsInOrder([
        templateTasks1.reversed.toList(),
        [templateTasks1[2], templateTasks1[1]],
        [newTask, templateTasks1[2], templateTasks1[1]],
        [templateTasks1[2], templateTasks1[1], completedTask],
      ]),
    );

    await repository.deleteTask(templateTasks1[0].id);

    await repository.addTask(newTask);

    await repository.updateTask(completedTask);
  });

  group('Working with specific task', () {
    test('Get task by ID existing', () async {
      final repository = getIt<TasksRepository>();

      await repository.syncTasks();

      final originalTask = templateTasks1.first;
      final takenTask = repository.getTaskById(originalTask.id);
      expect(takenTask, originalTask);
    });

    test('Get task by ID not existing', () async {
      final repository = getIt<TasksRepository>();

      await repository.syncTasks();

      final takenTask = repository.getTaskById(templateTasks2.first.id);
      expect(takenTask, isNull);
    });

    test('Subscribing on task', () async {
      final repository = getIt<TasksRepository>();

      await repository.syncTasks();

      final taskToUpdate = templateTasks1.first;
      final taskStream = repository.subscribeOnTaskById(taskToUpdate.id);

      final updatedTask = taskToUpdate.edit(
        title: 'Updated task!',
        description: 'This task was updated',
        importance: TaskImportance.important,
      );
      // Checking emiting from stream
      unawaited(repository.updateTask(updatedTask));
      await expectLater(taskStream, emits(updatedTask));

      // Checking if subscription is disposed
      final disposed = repository.disposeTaskSubscription(taskToUpdate.id);
      expect(disposed, isTrue);
    });
  });
}
