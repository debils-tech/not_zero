// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:not_zero/db/tags_table.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

@UseRowClass(Task, generateInsertable: true)
class TasksTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get modifiedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get importance => intEnum<TaskImportance>()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class TasksTagEntries extends Table {
  TextColumn get task => text().references(TasksTable, #id)();
  TextColumn get tag => text().references(TagsTable, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {task, tag};
}
