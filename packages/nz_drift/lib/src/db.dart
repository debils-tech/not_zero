import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:nz_io/nz_io.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

import 'database/open_database.dart';
import 'migrations/migrations.dart';
import 'tables/tags_table.dart';
import 'tables/tasks_table.dart';

part 'db.g.dart';

@DriftDatabase(tables: [TasksTable, TagsTable, TasksTagEntries])
class NotZeroDatabase extends _$NotZeroDatabase {
  NotZeroDatabase() : super(openDriftDatabase());

  NotZeroDatabase.memory() : super(openDriftDatabase(permanent: false));

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        await customStatement('PRAGMA foreign_keys = OFF');

        await m.runMigrationSteps(
          from: from,
          to: to,
          steps: notZeroMigrationSteps,
        );

        if (kDebugMode) {
          // Fail if the migration broke foreign keys
          final wrongForeignKeys =
              await customSelect('PRAGMA foreign_key_check').get();
          assert(
            wrongForeignKeys.isEmpty,
            'Wrong foreign keys: ${wrongForeignKeys.map((e) => e.data)}',
          );
        }

        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }

  Future<void> drop() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  Future<void> deleteFromDisk() async {
    final path = await getDatabasePath();
    if (path == null) return;

    final dbFile = File(path);
    if (dbFile.existsSync()) {
      await close();
      dbFile.deleteSync();
    }
  }
}
