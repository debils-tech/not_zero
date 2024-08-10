// Try to use "primary key" for selecting data by unique key.
// ignore_for_file: invalid_use_of_visible_for_overriding_member
import 'package:drift/drift.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';
import 'package:universal_io/io.dart';

import 'database/open_database.dart';
import 'tables/tags_table.dart';
import 'tables/tasks_table.dart';

part 'db.g.dart';

@DriftDatabase(tables: [TasksTable, TagsTable, TasksTagEntries])
class NotZeroDatabase extends _$NotZeroDatabase {
  NotZeroDatabase() : super(openDriftDatabase());

  NotZeroDatabase.memory() : super(openDriftDatabase(permament: false));

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // DateTime values was stored as string
          throw Exception('Not supported version');
        }
        if (from < 3) {
          // no "tags_table" and "tasks_tag_entries"
          await transaction(() async {
            await m.createTable(tagsTable);
            await m.createTable(tasksTagEntries);
          });
        }
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
