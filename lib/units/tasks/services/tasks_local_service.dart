import 'package:drift/drift.dart';
import 'package:not_zero/units/tasks/models/tasks_filters.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class TasksLocalService {
  TasksLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<Task>> getTasks(TasksFilters filters) async {
    final allTags = await _tagMappings;
    final joinedTagsWithTasks = _db.select(_db.tasksTable).join([
      leftOuterJoin(
        _db.tasksTagEntries,
        _db.tasksTagEntries.task.equalsExp(_db.tasksTable.id),
      ),
    ])
      ..orderBy(_tasksOrdering)
      ..groupBy([_db.tasksTable.id])
      ..where(_createFilterForTasks(filters));

    final tasksEntries = joinedTagsWithTasks.map((rows) {
      final task = rows.readTable(_db.tasksTable);
      final tagsForTask = allTags[task.id];
      if (tagsForTask == null) return task;
      return task.copyWith(tags: tagsForTask);
    });

    return tasksEntries.get();
  }

  Expression<bool> _createFilterForTasks(TasksFilters filters) {
    final tasksTable = _db.tasksTable;
    final dbFilters = <Expression<bool>>[];

    final searchTags = filters.searchTags;
    if (searchTags.isNotEmpty) {
      dbFilters.add(_db.tasksTagEntries.tag.isIn(searchTags));
    }

    final forDate = filters.forDate;
    if (forDate != null) {
      dbFilters.add(
        // If completed at queried day
        tasksTable.isCompleted & tasksTable.completedAt.sameDayAs(forDate) |
            // If not completed
            tasksTable.isNotCompleted &
                // Task for queried day
                (tasksTable.forDate.sameDayAs(forDate) |
                    // Persistent task for date before
                    tasksTable.isPersistent &
                        tasksTable.forDate.dayBefore(forDate)),
      );
    }

    if (dbFilters.isEmpty) {
      return const Constant(true);
    }
    return Expression.and(dbFilters);
  }

  Future<Map<String, List<ItemTag>>> get _tagMappings async {
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

  List<OrderingTerm> get _tasksOrdering => [
        OrderingTerm(expression: _db.tasksTable.isCompleted),
        OrderingTerm(
          expression: _db.tasksTable.importance,
          mode: OrderingMode.desc,
        ),
        OrderingTerm(expression: _db.tasksTable.createdAt),
      ];

  Future<void> saveTask(Task task) {
    return _db.transaction(() async {
      await _db
          .into(_db.tasksTable)
          .insertOnConflictUpdate(task.toInsertable());

      await (_db.delete(_db.tasksTagEntries)
            ..where((tbl) => tbl.task.equals(task.id)))
          .go();
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
