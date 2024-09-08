import 'package:drift/drift.dart';
import 'package:nz_drift/src/tables/tables.dart';

extension TasksTableHelper on TasksTable {
  Expression<bool> get isCompleted => completedAt.isNotNull();

  Expression<bool> get isNotCompleted => completedAt.isNull();

  Expression<bool> get isPersistent =>
      persistent.equalsExp(const Constant(true));

  Expression<bool> get isNotPersistent =>
      persistent.equalsExp(const Constant(false));
}
