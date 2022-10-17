// Try to use "primary key" for selecting data by unique key.
// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:not_zero/db/tasks_table.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

part 'db.g.dart';

@DriftDatabase(tables: [TasksTable])
class NotZeroDatabase extends _$NotZeroDatabase {
  NotZeroDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> drop() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // TODO(uSlashVlad): Implement DriftIsolate for database.
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      // It can be problematic to use database with files in test
      // (DB can be locked).
      // You can fix errors in test by using "-j 1" argument, but honestly it is
      // bad solution.
      // In-memory DB can't be locked and runs much faster
      // (that is usefull for tests).
      return NativeDatabase.memory();
    } else {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    }
  });
}
