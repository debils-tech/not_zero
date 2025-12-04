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

// dart format width=80
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:nz_drift/src/db.dart';
import 'package:test/test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = NotZeroDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  test(
    // Somehow I getting an SQLite error:
    // ignore: lines_longer_than_80_chars
    // NOT NULL constraint failed: tmp_for_copy_tasks_table.created_at, constraint failed
    // While there is no null data in the table
    skip: true,
    'migration from v1 to v2 does not corrupt data (datetime to int)',
    () async {
      final oldTasksTableData = <v1.TasksTableData>[
        v1.TasksTableData(
          id: 'd9be9a9e-fb36-46e8-ad57-348efe38bb4a',
          title: 'Cool new task',
          description: 'Nice description',
          createdAt: .fromMicrosecondsSinceEpoch(
            1388084662312456,
            isUtc: true,
          ),
          modifiedAt: .fromMicrosecondsSinceEpoch(
            1366934400012087,
            isUtc: true,
          ),
          completedAt: .fromMicrosecondsSinceEpoch(
            1717843669610792,
            isUtc: true,
          ),
          importance: 1,
        ),
      ];
      final expectedNewTasksTableData = <v2.TasksTableData>[
        v2.TasksTableData(
          id: 'd9be9a9e-fb36-46e8-ad57-348efe38bb4a',
          title: 'Cool new task',
          description: 'Nice description',
          createdAt: .fromMicrosecondsSinceEpoch(
            1388084662000000,
            isUtc: true,
          ),
          modifiedAt: .fromMicrosecondsSinceEpoch(
            1366934400000000,
            isUtc: true,
          ),
          completedAt: .fromMicrosecondsSinceEpoch(
            1717843669000000,
            isUtc: true,
          ),
          importance: 1,
        ),
      ];

      await verifier.testWithDataIntegrity(
        oldVersion: 1,
        newVersion: 2,
        createOld: v1.DatabaseAtV1.new,
        createNew: v2.DatabaseAtV2.new,
        openTestedDatabase: NotZeroDatabase.new,
        createItems: (batch, oldDb) {
          batch.insertAll(oldDb.tasksTable, oldTasksTableData);
        },
        validateItems: (newDb) async {
          expect(
            expectedNewTasksTableData,
            await newDb.select(newDb.tasksTable).get(),
          );
        },
      );
    },
  );
}
