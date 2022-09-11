import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/data/services/tasks_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
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

  // Clear DB after every test.
  tearDown(db.drop);

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
      isCompleted: true,
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
