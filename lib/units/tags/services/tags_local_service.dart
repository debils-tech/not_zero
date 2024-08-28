import 'package:nz_drift/nz_drift.dart';
import 'package:nz_tags_models/nz_tags_models.dart';

class TagsLocalService {
  TagsLocalService(this._db);

  final NotZeroDatabase _db;

  Future<List<ItemTag>> getTags() {
    return _db.select(_db.tagsTable).get();
  }

  Future<void> saveTag(ItemTag tag) {
    return _db.upsertIn(_db.tagsTable, tag.toInsertable());
  }

  Future<void> deleteTag(String tagId) {
    return (_db.delete(_db.tagsTable)..where((tbl) => tbl.id.equals(tagId)))
        .go();
  }
}
