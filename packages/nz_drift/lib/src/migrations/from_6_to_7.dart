part of 'migrations.dart';

Future<void> _from6To7(Migrator m, Schema7 schema) async {
  await m.createTable(schema.habitsTable);
  await m.createTable(schema.habitCompletionsTable);
  await m.createTable(schema.habitsTagEntries);
}
