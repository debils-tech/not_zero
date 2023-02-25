// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:not_zero/helpers/color_converter.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';

@UseRowClass(ItemTag, generateInsertable: true)
class TagsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get color =>
      text().map(const ColorDatabaseConverter()).nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
