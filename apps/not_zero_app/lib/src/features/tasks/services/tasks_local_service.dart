import 'package:drift/drift.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class TasksLocalService implements BaseService {
  const TasksLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<Task>> getTasks(TasksFilters filters) async {
    final allTags = await _tagMappings;
    final joinedTagsWithTasks =
        _db.select(_db.tasksTable).join([
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

    if (filters.someday) {
      dbFilters.add(tasksTable.forDate.isNull());
    }

    assert(
      filters.forDate == null || !filters.someday,
      'Filtering by "forDate" and by "someday" at the same '
      'will result in empty set of tasks '
      'since "someday" is when "forDate" != null',
    );

    final canceled = filters.canceled;
    if (canceled != null) {
      dbFilters.add(
        canceled ? tasksTable.isCanceled : tasksTable.isNotCanceled,
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

      await (_db.delete(
        _db.tasksTagEntries,
      )..where((tbl) => tbl.task.equals(task.id))).go();
      for (final tag in task.tags) {
        await _db
            .into(_db.tasksTagEntries)
            .insertOnConflictUpdate(TasksTagEntry(task: task.id, tag: tag.id));
      }
    });
  }

  // It neither update tags nor inserts new data, only updates fields for
  // multiple rows in single transaction.
  Future<void> updateTasks(Iterable<Task> tasks) {
    return _db.transaction(() async {
      for (final task in tasks) {
        final affected = await _db
            .update(_db.tasksTable)
            .replace(task.toInsertable());

        assert(
          affected,
          "Somehow tried to update task that wasn't presented in the db",
        );
      }
    });
  }

  Future<void> deleteTasks(Iterable<String> tasks) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.tasksTable,
      )..where((tbl) => tbl.id.isIn(tasks))).go();
      await (_db.delete(
        _db.tasksTagEntries,
      )..where((tbl) => tbl.task.isIn(tasks))).go();
    });
  }
}
