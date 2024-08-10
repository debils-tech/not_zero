import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/get_it.dart';
import 'package:nz_drift/nz_drift.dart';

import 'template_tags.dart';

void configDatabaseForTags() {
  setUp(() async {
    final db = getIt<StorageProvider>().database;
    await db.transaction(() async {
      for (final t in templateTags) {
        await db.upsertIn(db.tagsTable, t.toInsertable());
      }
    });
  });

  tearDown(() => getIt<StorageProvider>().database.drop());
}
