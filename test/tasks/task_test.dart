import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

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

  test('Task edit', () {
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

  // TODO(uSlashVlad): Added test for [compareTo].
}
