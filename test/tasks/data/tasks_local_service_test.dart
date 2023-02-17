import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';

import '../../global_init.dart';
import '../tasks_db_config.dart';
import '../template_tasks.dart';

void main() {
  globalInit();
  configDatabaseForTasks();

  test('Get tasks', () async {
    final service = getIt<TasksLocalService>();

    final tasks = await service.getTasks();

    expect(tasks, unorderedEquals(templateTasks1));
  });

  test('Save tasks', () async {
    final service = getIt<TasksLocalService>();

    // Actual saving.
    for (final t in templateTasks2) {
      await service.saveTask(t);
    }

    // Testing saved data by comparing with actual data in DB.
    final db = getIt<StorageProvider>().database;
    for (final t in templateTasks2) {
      final recordFromDb = await db.findByKey(db.tasksTable, t.id);
      expect(recordFromDb, isNotNull);
      expect(recordFromDb, t);
    }

    // Overwriting some record.
    final taskForCopy = templateTasks2[1].copyWith(
      title: 'New task!',
      completedAt: DateTime.now().withSecondsAccuracy,
    );
    await service.saveTask(taskForCopy);
    final recordFromDb = await db.findByKey(db.tasksTable, taskForCopy.id);
    expect(recordFromDb, isNotNull);
    expect(recordFromDb, taskForCopy);
  });

  test('Delete tasks', () async {
    final service = getIt<TasksLocalService>();

    // Remove 2 tasks from DB.
    await service
        .deleteTasks([templateTasks1.first.id, templateTasks1.last.id]);

    // Check if they are removed and second task is still there.
    final db = getIt<StorageProvider>().database;
    for (final t in templateTasks1) {
      final recordFromDb = await db.findByKey(db.tasksTable, t.id);
      if (t.id == templateTasks1[1].id) {
        expect(recordFromDb, isNotNull);
        expect(recordFromDb, t);
      } else {
        expect(recordFromDb, isNull);
      }
    }
  });
}
