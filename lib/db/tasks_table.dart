// coverage:ignore-file

import 'package:drift/drift.dart';
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
