// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:not_zero/db/tasks_table.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';

@UseRowClass(ItemTag, generateInsertable: true)
class TagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get colorIndex => integer().named('color')();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('TasksTagEntry')
class TasksTagEntries extends Table {
  TextColumn get task => text().references(TasksTable, #id)();
  TextColumn get tag => text().references(TagsTable, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {task, tag};
}
