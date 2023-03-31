import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

@lazySingleton
class TasksLocalService {
  TasksLocalService(StorageProvider storage) : _db = storage.database;

  final NotZeroDatabase _db;

  Future<List<Task>> getTasks({String? tagId}) {
    if (tagId == null) {
      return _getTasksWithoutFilter();
    }

    return _getTasksForTag(tagId: tagId);
  }

  Future<List<Task>> _getTasksWithoutFilter() async {
    final allTags = await _getTagMappings();
    final tasks = _db.select(_db.tasksTable).map(
      (task) {
        final tagsForTask = allTags[task.id];
        if (tagsForTask == null) return task;
        return task.copyWith(tags: tagsForTask);
      },
    );
    return tasks.get();
  }

  Future<List<Task>> _getTasksForTag({required String tagId}) async {
    final allTags = await _getTagMappings();
    final tasksEntries = (_db.select(_db.tasksTagEntries).join([
      innerJoin(
        _db.tasksTable,
        _db.tasksTagEntries.task.equalsExp(_db.tasksTable.id),
      )
    ])
          ..where(_db.tasksTagEntries.tag.equals(tagId)))
        .map((rows) {
      final task = rows.readTable(_db.tasksTable);
      final tagsForTask = allTags[task.id];
      if (tagsForTask == null) return task;
      return task.copyWith(tags: tagsForTask);
    });
    return tasksEntries.get();
  }

  Future<Map<String, List<ItemTag>>> _getTagMappings() async {
    final tags = await _db.select(_db.tasksTagEntries).join(
      [
        innerJoin(
          _db.tagsTable,
          _db.tasksTagEntries.tag.equalsExp(_db.tagsTable.id),
        ),
      ],
    ).get();

    final map = <String, List<ItemTag>>{};
    for (final tagRow in tags) {
      final taskId = tagRow.read(_db.tasksTagEntries.task)!;
      final tag = tagRow.readTable(_db.tagsTable);
      map.putIfAbsent(taskId, () => []).add(tag);
    }

    return map;
  }

  Future<void> saveTask(Task task) {
    return _db.transaction(() async {
      await _db.upsertIn(_db.tasksTable, task.toInsertable());
      for (final tag in task.tags) {
        await _db.upsertIn(
          _db.tasksTagEntries,
          TasksTagEntry(task: task.id, tag: tag.id),
        );
      }
    });
  }

  Future<void> deleteTasks(Iterable<String> tasks) {
    return _db.transaction(() async {
      await (_db.delete(_db.tasksTable)..where((tbl) => tbl.id.isIn(tasks)))
          .go();
      await (_db.delete(_db.tasksTagEntries)
            ..where((tbl) => tbl.task.isIn(tasks)))
          .go();
    });
  }
}
