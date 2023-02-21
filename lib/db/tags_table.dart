// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:not_zero/units/tasks/domain/models/tag.dart';

@UseRowClass(ItemTag, generateInsertable: true)
class TagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  BoolColumn get folder => boolean()();
  IntColumn get order => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
