import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/data/services/tasks_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'tasks_db_config.dart';
import 'template_tasks.dart';

void main() {
  configureDependencies();
  configDatabaseForTasks();

  final service = getIt<TasksLocalService>();

  test('Get tasks', () async {
    final tasks = await service.getTasks();
    // Sorting is necessary since "getTasks" doesn't guarantee the right order.
    tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    expect(listEquals(templateTasks1, tasks), true);
  });

  test('Save tasks', () async {
    // Actual saving.
    for (final t in templateTasks2) {
      await service.saveTask(t);
    }

    // Testing saved data by comparing with actual data in DB.
    final collection = getTasksCollection();
    for (final t in templateTasks2) {
      final recordFromDb = await collection.findByKey(t.id);
      expect(recordFromDb, isNotNull);
      expect(t, Task.fromJson(recordFromDb!));
    }

    // Overwriting some record.
    final taskForCopy = templateTasks2[1].copyWith(
      title: 'New task!',
      completedAt: DateTime.fromMillisecondsSinceEpoch(1664392368),
    );
    await service.saveTask(taskForCopy);
    final recordFromDb = await collection.findByKey(taskForCopy.id);
    expect(recordFromDb, isNotNull);
    expect(taskForCopy, Task.fromJson(recordFromDb!));
  });

  test('Delete tasks', () async {
    // Remove 2 tasks from DB.
    await service
        .deleteTasks([templateTasks1.first.id, templateTasks1.last.id]);

    // Check if they are removed and second task is still there.
    final collection = getTasksCollection();
    for (final t in templateTasks1) {
      final recordFromDb = await collection.findByKey(t.id);
      if (t.id == templateTasks1[1].id) {
        expect(recordFromDb, isNotNull);
        expect(t, Task.fromJson(recordFromDb!));
      } else {
        expect(recordFromDb, isNull);
      }
    }
  });
}
