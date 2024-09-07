part of 'migrations.dart';

Future<void> _from1To2(Migrator m, Schema2 schema) async {
  final dateTimeColumns =
      schema.tasksTable.$columns.where((c) => c.type == DriftSqlType.dateTime);

  if (dateTimeColumns.isNotEmpty) {
    // This table has dateTime columns which need to be migrated.
    await m.alterTable(TableMigration(
      schema.tasksTable,
      columnTransformer: {
        for (final column in dateTimeColumns)
          // We assume that the column in the database is a string. We want
          // to parse it to a date in SQL and then get the unix timestamp of
          // it.
          // Note that this requires sqlite version 3.38 or above.
          column: FunctionCallExpression('unixepoch', [column]),
      },
    ));
  }
}
