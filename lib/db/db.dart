// Try to use "primary key" for selecting data by unique key.
// ignore_for_file: invalid_use_of_visible_for_overriding_member
import 'package:drift/drift.dart';
import 'package:not_zero/db/drift/open_database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/db/tags_table.dart';
import 'package:not_zero/db/tasks_table.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

part 'db.g.dart';

@DriftDatabase(tables: [TasksTable, TagsTable, TasksTagEntries])
class NotZeroDatabase extends _$NotZeroDatabase {
  NotZeroDatabase() : super(openDriftDatabase());

  NotZeroDatabase.connect(super.connection) : super.connect();

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
    final dbFile = File(await _getDatabasePath());
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

Future<String> _getDatabasePath() async {
  final storagePath = await StorageProvider.storageDirectory;
  return p.join(storagePath, 'db.sqlite');
}
