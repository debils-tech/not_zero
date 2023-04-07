import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/date_transformations.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';

import '../../global_init.dart';
import '../../tags/template_tags.dart';
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

  test('Get tasks with tags', () async {
    final service = getIt<TasksLocalService>();
    final db = getIt<StorageProvider>().database;

    final tag1 = templateTags[0];
    final tag2 = templateTags[1];
    final tag3 = templateTags[2];
    final tag4 = templateTags[3];
    final task1 = templateTasks2[0].copyWith(tags: [tag1, tag2]);
    final task2 = templateTasks2[1].copyWith(tags: [tag2, tag4]);
    final task3 = templateTasks2[2].copyWith(tags: [tag3, tag4]);
    final editedTasks = [task1, task2, task3];
    final tasksToTagsRelations = [
      TasksTagEntry(task: task1.id, tag: tag1.id),
      TasksTagEntry(task: task1.id, tag: tag2.id),
      TasksTagEntry(task: task2.id, tag: tag2.id),
      TasksTagEntry(task: task2.id, tag: tag4.id),
      TasksTagEntry(task: task3.id, tag: tag3.id),
      TasksTagEntry(task: task3.id, tag: tag4.id),
    ];

    // Inserting tags
    for (final tag in templateTags) {
      await db.upsertIn(db.tagsTable, tag.toInsertable());
    }
    // Inserting tasks
    for (final task in editedTasks) {
      await db.upsertIn(db.tasksTable, task.toInsertable());
    }
    // Inserting relations between tasks with tags
    for (final tagEntry in tasksToTagsRelations) {
      await db.upsertIn(db.tasksTagEntries, tagEntry);
    }

    // Actual getting and comparing
    var tasks = await service.getTasks(searchTags: {tag1.id});
    expect(tasks, unorderedEquals([task1]));
    tasks = await service.getTasks(searchTags: {tag1.id, tag2.id});
    expect(tasks, unorderedEquals([task1, task2]));
    tasks = await service.getTasks(searchTags: {tag1.id, tag3.id});
    expect(tasks, unorderedEquals([task1, task3]));
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

  test('Save with tags', () async {
    final service = getIt<TasksLocalService>();
    final db = getIt<StorageProvider>().database;

    // Cleaning all tasks
    await service.deleteTasks(templateTasks1.map((e) => e.id));
    expect(await service.getTasks(), isEmpty);

    // Inserting tags
    for (final tag in templateTags) {
      await db.upsertIn(db.tagsTable, tag.toInsertable());
    }

    final taskWithTag = templateTasks2.first.copyWith(
      tags: [templateTags[0], templateTags[1]],
    );
    await service.saveTask(taskWithTag);

    expect((await service.getTasks()).single, taskWithTag);
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
