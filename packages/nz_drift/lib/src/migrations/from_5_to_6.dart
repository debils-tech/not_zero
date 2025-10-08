part of 'migrations.dart';

Future<void> _from5To6(Migrator m, Schema6 schema) async {
  await m.alterTable(TableMigration(schema.tagsTable));
  await m.addColumn(schema.tasksTable, schema.tasksTable.canceledAt);
  await m.alterTable(TableMigration(schema.tasksTable));
}
