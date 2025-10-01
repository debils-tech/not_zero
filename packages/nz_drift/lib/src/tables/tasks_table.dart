// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_base_models/nz_base_models.dart';

@UseRowClass(Task, generateInsertable: true)
class TasksTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get forDate => text().map(const DateConverter())();
  BoolColumn get persistent => boolean()();
  DateTimeColumn get modifiedAt => dateTime().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();
  IntColumn get importance => intEnum<TaskImportance>()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
