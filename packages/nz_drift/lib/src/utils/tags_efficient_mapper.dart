import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/nz_drift.dart';

final class TagsEfficientMapper {
  TagsEfficientMapper(this._db);

  final NotZeroDatabase _db;

  final _tagsCache = <String, ItemTag>{};

  Future<List<ItemTag>> readTaskTags(TypedResult row) async {
    final tags = row.read(_db.tasksTagEntries.tagsList)?.split(',') ?? [];
    if (tags.isEmpty) return <ItemTag>[];

    return getTags(tags);
  }

  Future<List<ItemTag>> readHabitTags(TypedResult row) async {
    final tags = row.read(_db.habitsTagEntries.tagsList)?.split(',') ?? [];
    if (tags.isEmpty) return <ItemTag>[];

    return getTags(tags);
  }

  Future<List<ItemTag>> getTags(Iterable<String> ids) async {
    // Watch if there is any tags that wasn't loaded
    final missingTags = ids.where((id) => !_tagsCache.keys.contains(id));
    if (missingTags.isNotEmpty) {
      // Load and cache missing tags
      final query = _db.select(_db.tagsTable)
        ..where((tbl) => tbl.id.isIn(missingTags));
      final tags = await query.get();

      for (final tag in tags) {
        _tagsCache.putIfAbsent(tag.id, () => tag);
      }
    }

    // Return the loaded tags (new tags are cached at this point)
    return ids.map((id) => _tagsCache[id]).nonNulls.toList();
  }
}
