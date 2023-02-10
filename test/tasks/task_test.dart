import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:uuid/uuid.dart';

import 'template_tasks.dart';

void main() {
  test('Task create', () {
    final timeBeforeCreation = DateTime.now();
    final task = Task.create(
      title: 'Test task',
      description: 'Test description',
      importance: TaskImportance.important,
    );

    expect(task.id, matches(PatternValidator.uuidPattern));
    expect(task.title, 'Test task');
    expect(task.description, 'Test description');
    expect(task.createdAt.isAfter(timeBeforeCreation), true);
    expect(task.modifiedAt, isNull);
    expect(task.importance, TaskImportance.important);
    expect(task.isCompleted, false);
  });

  test('Task edit with fields', () {
    final originalTask = templateTasks1.first;
    final task = originalTask.edit(
      title: 'Edited title',
      description: 'Test description',
      importance: TaskImportance.notImportant,
    );

    expect(task.id, originalTask.id);
    expect(task.title, 'Edited title');
    expect(task.description, 'Test description');
    expect(task.createdAt, originalTask.createdAt);
    expect(task.createdAt, originalTask.createdAt);
    expect(task.modifiedAt, isNotNull);
    expect(task.importance, TaskImportance.notImportant);
    expect(task.isCompleted, originalTask.isCompleted);
  });

  test('Task edit without fields', () {
    final originalTask = templateTasks1.first;
    final task = originalTask.edit();


    expect(task.id, originalTask.id);
    expect(task.title, originalTask.title);
    expect(task.description, originalTask.description);
    expect(task.createdAt, originalTask.createdAt);
    expect(task.createdAt, originalTask.createdAt);
    expect(task.modifiedAt, isNotNull);
    expect(task.importance, originalTask.importance);
    expect(task.isCompleted, originalTask.isCompleted);
  });

  test('Task toJson', () {
    final task = templateTasks1.first;

    expect(task.toJson(), {
      'id': task.id,
      'title': task.title,
      'description': task.description,
      'createdAt': task.createdAt.toIso8601String(),
      'modifiedAt': task.modifiedAt?.toIso8601String(),
      'completedAt': task.completedAt?.toIso8601String(),
      'importance': task.importance.name,
    });
  });

  test('Task fromJson', () {
    final task = templateTasks1.first;
    final recreatedTask = Task.fromJson(task.toJson());

    expect(recreatedTask, task);
  });

  group('Sorting', () {
    test('... by completion', () {
      final task1 = Task(
        id: const Uuid().v4(),
        title: 'Task 1',
        createdAt: DateTime.now(),
        importance: TaskImportance.normal,
        completedAt: DateTime.now(),
      );
      final task2 = Task(
        id: const Uuid().v4(),
        title: 'Task 2',
        createdAt: DateTime.now(),
        importance: TaskImportance.normal,
      );
      expect(task1.compareTo(task2), -1);
      expect([task1, task2]..sort(), [task1, task2]);
    });

    test('... by importance', () {
      final task1 = Task(
        id: const Uuid().v4(),
        title: 'Task 1',
        createdAt: DateTime.now(),
        importance: TaskImportance.important,
      );
      final task2 = Task(
        id: const Uuid().v4(),
        title: 'Task 1',
        createdAt: DateTime.now(),
        importance: TaskImportance.normal,
      );
      expect(task1.compareTo(task2), 1);
      expect([task1, task2]..sort(), [task2, task1]);
    });

    test('... by time', () {
      final task1 = Task(
        id: const Uuid().v4(),
        title: 'Task 1',
        createdAt: DateTime.now(),
        importance: TaskImportance.normal,
      );
      final task2 = Task(
        id: const Uuid().v4(),
        title: 'Task 1',
        createdAt: DateTime.now(),
        importance: TaskImportance.normal,
      );
      expect(task1.compareTo(task2), -1);
      expect([task1, task2]..sort(), [task1, task2]);
    });

    test('Complex', () {
      final testList1 = templateTasks1.toList()..sort();
      expect(
        testList1,
        [templateTasks1[0], templateTasks1[1], templateTasks1[2]],
      );

      final testList2 = templateTasks3.toList()..sort();
      expect(
        testList2,
        [
          templateTasks3[1], // completed, notImportant
          templateTasks3[0], // completed, normal, older
          templateTasks3[6], // completed, normal, newer
          templateTasks3[3], // completed, important
          templateTasks3[4], // notImportant
          templateTasks3[2], // important, older
          templateTasks3[5], // important, newer
        ],
      );
    });
  });
}
