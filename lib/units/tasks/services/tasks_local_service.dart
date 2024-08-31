import 'package:drift/drift.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class TasksLocalService {
  TasksLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<Task>> getTasks({Set<String>? searchTags}) {
    if (searchTags == null || searchTags.isEmpty) {
      return _getTasksWithoutFilter();
    }

    return _getTasksForTag(searchTags: searchTags);
  }

  Future<List<Task>> _getTasksWithoutFilter() async {
    final allTags = await _getTagMappings();
    final tasksQuery = _db.select(_db.tasksTable)..orderBy(_tasksOrdering);
    final tasksEntries = tasksQuery.map(
      (task) {
        final tagsForTask = allTags[task.id];
        if (tagsForTask == null) return task;
        return task.copyWith(tags: tagsForTask);
      },
    );
    return tasksEntries.get();
  }

  Future<List<Task>> _getTasksForTag({required Set<String> searchTags}) async {
    final allTags = await _getTagMappings();
    final joinedTagsWithTasks = _db.select(_db.tasksTagEntries).join([
      innerJoin(
        _db.tasksTable,
        _db.tasksTagEntries.task.equalsExp(_db.tasksTable.id),
      ),
    ])
      ..orderBy(_tasksOrdering.map((e) => e(_db.tasksTable)).toList())
      ..groupBy([_db.tasksTagEntries.task])
      ..where(_db.tasksTagEntries.tag.isIn(searchTags));

    final tasksEntries = joinedTagsWithTasks.map((rows) {
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

  List<OrderingTerm Function($TasksTableTable)> get _tasksOrdering => [
        (u) => OrderingTerm(
              expression: u.completedAt.isNotNull(),
            ),
        (u) => OrderingTerm(
              expression: u.importance,
              mode: OrderingMode.desc,
            ),
        (u) => OrderingTerm(expression: u.createdAt),
      ];

  Future<void> saveTask(Task task) {
    return _db.transaction(() async {
      await _db
          .into(_db.tasksTable)
          .insertOnConflictUpdate(task.toInsertable());

      for (final tag in task.tags) {
        await _db
            .into(_db.tasksTagEntries)
            .insertOnConflictUpdate(TasksTagEntry(task: task.id, tag: tag.id));
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
