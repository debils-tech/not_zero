// coverage:ignore-file

import 'package:drift/drift.dart';
import 'package:nz_drift/src/converters/score_entry_metadata_converter.dart';
import 'package:nz_score_models/nz_score_models.dart';

@UseRowClass(ScoreEntry, generateInsertable: true)
class ScoreEntryTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get score => integer()();
  TextColumn get scoreType => textEnum()();
  TextColumn get metadata => text()
      .map(const ScoreEntryMetadataConverter())
      .withDefault(const Constant('{}'))();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
