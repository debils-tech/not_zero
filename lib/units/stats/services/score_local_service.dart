import 'package:drift/drift.dart';
import 'package:nz_drift/nz_drift.dart';
import 'package:nz_score_models/nz_score_models.dart';

class ScoreLocalService {
  ScoreLocalService(this._db);

  final NotZeroDatabase _db;

  Future<void> saveNewEntry(ScoreEntry scoreEntry) {
    return _db.into(_db.scoreEntryTable).insert(
          scoreEntry.toInsertable(),
          mode: InsertMode.insertOrReplace,
        );
  }
}
