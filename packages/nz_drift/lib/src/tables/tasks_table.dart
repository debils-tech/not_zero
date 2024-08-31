// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

@UseRowClass(Task, generateInsertable: true)
class TasksTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get forDate => dateTime()();
  BoolColumn get persistent => boolean().withDefault(const Constant(false))();
  DateTimeColumn get modifiedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get importance => intEnum<TaskImportance>()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
