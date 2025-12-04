// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:drift/drift.dart';
import 'package:not_zero_app/src/features/tasks/models/tasks_filters.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_common/nz_common.dart';
import 'package:nz_drift/nz_drift.dart';

class TasksLocalService implements BaseService {
  const TasksLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<Task>> getTasks(TasksFilters filters) {
    return _db.transaction(() async {
      final joinedTagsWithTasks =
          _db.select(_db.tasksTable).join([
              leftOuterJoin(
                _db.tasksTagEntries,
                _db.tasksTagEntries.task.equalsExp(_db.tasksTable.id),
                useColumns: false,
              ),
            ])
            ..addColumns({_db.tasksTagEntries.tagsList})
            ..orderBy(_tasksOrdering)
            ..groupBy([_db.tasksTable.id])
            ..where(_createFilterForTasks(filters));

      final tagsMapper = TagsEfficientMapper(_db);
      return joinedTagsWithTasks.asyncMap((rows) async {
        final task = rows.readTable(_db.tasksTable);
        final tags = await tagsMapper.readTaskTags(rows);
        return task.copyWith(tags: tags);
      }).get();
    });
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

  Future<void> deleteTasks(Iterable<String> tasks) {
    return _db.transaction(() async {
      await (_db.delete(
        _db.tasksTagEntries,
      )..where((tbl) => tbl.task.isIn(tasks))).go();
      await (_db.delete(
        _db.tasksTable,
      )..where((tbl) => tbl.id.isIn(tasks))).go();
    });
  }
}
