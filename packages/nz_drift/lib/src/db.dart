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

import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_drift/src/converters/date_converter.dart';
import 'package:nz_drift/src/database/native_database.dart';
import 'package:nz_drift/src/migrations/migrations.dart';
import 'package:nz_drift/src/tables/check_in_table.dart';
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
    CheckInTable,
  ],
)
class NotZeroDatabase extends _$NotZeroDatabase {
  NotZeroDatabase([QueryExecutor? e]) : super(e ?? openDriftDatabase());

  NotZeroDatabase.memory() : super(openDriftDatabase(permanent: false));

  @override
  int get schemaVersion => 8;

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

  Future<void> deleteFromDisk() async {
    final path = await getDatabasePath();

    final dbFile = File(path);
    if (dbFile.existsSync()) {
      await close();
      dbFile.deleteSync();
    }
  }

  Future<Stream<Uint8List>> backupToStream() async {
    final backupPath = await getBackupDatabasePath();
    final backupFile = File(backupPath);

    // VACUUM requires the target file to not exist
    if (backupFile.existsSync()) {
      backupFile.deleteSync();
    }

    await customStatement('VACUUM INTO ?', [backupPath]);

    final stream = backupFile.openRead();

    // Wrap the stream to delete file when fully read
    final controller = StreamController<List<int>>();
    final subscription = stream.listen(
      controller.add,
      onError: controller.addError,
      onDone: () async {
        // Close controller and delete file after last listener is done
        await controller.close();
        if (backupFile.existsSync()) {
          backupFile.deleteSync();
        }
      },
      cancelOnError: false,
    );
    // Propagate pause and resume to the original subscription
    controller
      ..onPause = subscription.pause
      ..onResume = subscription.resume
      ..onCancel = subscription.cancel;

    return controller.stream.map(Uint8List.fromList);
  }

  Future<void> restoreFromStream(Stream<Uint8List> dataStream) async {
    // Deleting the current database
    await deleteFromDisk();

    // Creating the new database file
    final dbFile = File(await getDatabasePath());
    if (!dbFile.existsSync()) {
      dbFile.createSync();
    }

    // Writing all the data to the new database file
    final dbFileSink = dbFile.openWrite();
    await dbFileSink.addStream(dataStream);

    // Flushing and closing the file
    await dbFileSink.flush();
    await dbFileSink.close();
  }
}
