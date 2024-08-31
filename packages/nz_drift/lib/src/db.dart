// Try to use "primary key" for selecting data by unique key.
// ignore_for_file: invalid_use_of_visible_for_overriding_member
import 'dart:math' as math;

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:nz_drift/src/migrations/schema_versions.dart';
import 'package:nz_io/nz_io.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

import 'database/open_database.dart';
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

        if (from < 2) {
          // Tasks table was broken in v0 (string DateTime)
          await transaction(() async {
            await m.drop(tasksTable);
            await m.createTable(tasksTable);
          });
        }

        await m.runMigrationSteps(
          from: math.max(2, from),
          to: to,
          steps: migrationSteps(
            from2To3: (m, schema) async {
              await m.createTable(schema.tagsTable);
              await m.createTable(schema.tasksTagEntries);
            },
            from3To4: (m, schema) async {
              await m.alterTable(
                TableMigration(
                  schema.tasksTable,
                  columnTransformer: {
                    schema.tasksTable.forDate:
                        schema.tasksTable.completedAt.iif(
                      schema.tasksTable.completedAt.isNotNull(),
                      schema.tasksTable.createdAt,
                    ),
                    schema.tasksTable.persistent: const Constant(false),
                  },
                ),
              );
            },
          ),
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

  Future<void> upsertIn<T extends Table, D>(
    TableInfo<T, D> table,
    Insertable<D> insertable,
  ) {
    return into(table).insertOnConflictUpdate(insertable);
  }

  Future<D?> findByKey<T extends Table, D>(
    TableInfo<T, D> table,
    Object key,
  ) {
    return (select(table)..where((tbl) => tbl.primaryKey!.single.equals(key)))
        .getSingleOrNull();
  }

  Future<void> deleteByKey<T extends Table, D>(
    TableInfo<T, D> table,
    Object key,
  ) {
    return (delete(table)..where((tbl) => tbl.primaryKey!.single.equals(key)))
        .go();
  }
}
