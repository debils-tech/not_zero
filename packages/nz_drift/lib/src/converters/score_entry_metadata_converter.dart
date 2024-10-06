import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:nz_score_models/nz_score_models.dart';

class ScoreEntryMetadataConverter
    extends TypeConverter<ScoreEntryMetadata, String> {
  const ScoreEntryMetadataConverter();

  @override
  ScoreEntryMetadata fromSql(String fromDb) {
    final json = jsonDecode(fromDb);
    return ScoreEntryMetadata.fromJson(json);
  }

  @override
  String toSql(ScoreEntryMetadata value) {
    final json = value.toJson();
    return jsonEncode(json);
  }
}
