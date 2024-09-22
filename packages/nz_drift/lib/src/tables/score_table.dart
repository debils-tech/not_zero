// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:nz_score_models/nz_score_models.dart';

@UseRowClass(ScoreEntry, generateInsertable: true)
@TableIndex(name: 'score_created_at_idx', columns: {#createdAt})
@TableIndex(name: 'score_type_idx', columns: {#scoreType})
class ScoreTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get value => integer()();
  TextColumn get scoreType => textEnum()();
  TextColumn get metadata => text().withDefault(const Constant('{}'))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
