import 'package:flutter_test/flutter_test.dart';
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

    expect(task.id, matches(_uuidPattern));
    expect(task.title, 'Test task');
    expect(task.description, 'Test description');
    expect(task.createdAt.isAfter(timeBeforeCreation), true);
    expect(task.modifiedAt, isNull);
    expect(task.importance, TaskImportance.important);
    expect(task.isCompleted, false);
  });

  test('Task edit', () {
    final originalTask = templateTasks1.first;
    final task = Task.edit(
      task: originalTask,
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
}

final _uuidPattern = RegExp('^[a-f0-9]{8}-'
    '[a-f0-9]{4}-'
    '[a-f0-9]{4}-'
    '[a-f0-9]{4}-'
    r'[a-f0-9]{12}$');
