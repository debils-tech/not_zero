// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
    HabitsTagEntries,
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
