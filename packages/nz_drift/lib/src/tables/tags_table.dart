// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/src/tables/tasks_table.dart';

@UseRowClass(ItemTag, generateInsertable: true)
class TagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get colorIndex => integer().named('color')();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

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
