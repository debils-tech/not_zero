part of 'migrations.dart';

Future<void> _from4To5(Migrator m, Schema5 schema) {
  return m.alterTable(
    TableMigration(
      schema.tasksTable,
      columnTransformer: {
        schema.tasksTable.forDate: schema.tasksTable.forDate
            .dartCast<DateTime>()
            .modify(const DateTimeModifier.localTime())
            .date,
      },
    ),
  );
}
