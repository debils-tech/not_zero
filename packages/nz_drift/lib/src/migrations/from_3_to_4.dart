part of 'migrations.dart';

Future<void> _from3To4(Migrator m, Schema4 schema) {
  return m.alterTable(
    TableMigration(
      schema.tasksTable,
      columnTransformer: {
        schema.tasksTable.forDate: schema.tasksTable.completedAt.iif(
          schema.tasksTable.completedAt.isNotNull(),
          schema.tasksTable.createdAt,
        ),
        schema.tasksTable.persistent: const Constant(false),
      },
    ),
  );
}
