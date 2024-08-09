import 'package:drift/drift.dart' as drift;
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tags/data/tags_local_service.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:nz_common/nz_common.dart';
import 'package:uuid/uuid.dart';

import '../../global_init.dart';
import '../tags_db_config.dart';
import '../template_tags.dart';

void main() {
  globalInit();
  configDatabaseForTags();

  test('Get tags', () async {
    final service = getIt<TagsLocalService>();

    final tags = await service.getTags();
    expect(tags, unorderedEquals(tags));

    final db = getIt<StorageProvider>().database;
    await db.tagsTable.deleteAll();

    final tagsAfterClear = await service.getTags();
    expect(tagsAfterClear, isEmpty);
  });

  test('Save tags', () async {
    final service = getIt<TagsLocalService>();

    final date = DateTime.now().startOfDay;
    // Actual saving.
    final newTags = List.generate(
      10,
      (index) => ItemTag(
        id: const Uuid().v4(),
        name: 'NewTag$index',
        createdAt: date.add(Duration(days: index)),
      ),
    );
    for (final tag in newTags) {
      await service.saveTag(tag);
    }

    // Testing saved data by comparing with actual data in DB.
    final db = getIt<StorageProvider>().database;
    for (final tag in newTags) {
      final recordFromDb = await db.findByKey(db.tagsTable, tag.id);
      expect(recordFromDb, isNotNull);
      expect(recordFromDb, tag);
    }
  });

  test('Delete tags', () async {
    final service = getIt<TagsLocalService>();

    await service.deleteTag(templateTags[0].id);
    await service.deleteTag(templateTags[1].id);
    await service.deleteTag(templateTags[3].id);

    expect(
      await service.getTags(),
      unorderedEquals([templateTags[2], templateTags[4]]),
    );

    await service.deleteTag(templateTags[2].id);
    await service.deleteTag(templateTags[4].id);

    expect(await service.getTags(), isEmpty);
  });
}
