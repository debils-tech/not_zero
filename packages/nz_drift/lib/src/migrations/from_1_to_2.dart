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

part of 'migrations.dart';

Future<void> _from1To2(Migrator m, Schema2 schema) async {
  final dateTimeColumns = schema.tasksTable.$columns.where(
    (c) => c.type == DriftSqlType.dateTime,
  );

  if (dateTimeColumns.isNotEmpty) {
    // This table has dateTime columns which need to be migrated.
    await m.alterTable(
      TableMigration(
        schema.tasksTable,
        columnTransformer: {
          for (final column in dateTimeColumns)
            // We assume that the column in the database is a string. We want
            // to parse it to a date in SQL and then get the unix timestamp of
            // it.
            // Note that this requires sqlite version 3.38 or above.
            column: FunctionCallExpression('unixepoch', [column]),
        },
      ),
    );
  }
}
