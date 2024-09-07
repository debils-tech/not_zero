part of 'migrations.dart';

Future<void> _from2To3(Migrator m, Schema3 schema) async {
  await m.createTable(schema.tagsTable);
  await m.createTable(schema.tasksTagEntries);
}
