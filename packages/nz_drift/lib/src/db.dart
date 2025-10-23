import 'dart:io';

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_drift/src/converters/habit_regularity_converter.dart';
import 'package:nz_drift/src/database/native_database.dart';
import 'package:nz_drift/src/migrations/migrations.dart';
import 'package:nz_drift/src/tables/habits_table.dart';
import 'package:nz_drift/src/tables/tags_table.dart';
import 'package:nz_drift/src/tables/tasks_table.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    TasksTable,
    TagsTable,
    TasksTagEntries,
    HabitsTable,
    HabitCompletionsTable,
  ],
)
class NotZeroDatabase extends _$NotZeroDatabase {
  NotZeroDatabase([QueryExecutor? e]) : super(e ?? openDriftDatabase());

  NotZeroDatabase.memory() : super(openDriftDatabase(permanent: false));

  @override
  int get schemaVersion => 7;

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

        // Fail if the migration broke foreign keys
        assert(
          (await customSelect('PRAGMA foreign_key_check').get()).isEmpty,
          'Wrong foreign keys',
        );

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
