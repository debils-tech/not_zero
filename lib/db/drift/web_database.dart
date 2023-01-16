import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor openDriftDatabase() {
  return LazyDatabase(() async {
    // TODO(uSlashVlad): Implement WebWorkers for database.
    return WebDatabase.withStorage(
      await DriftWebStorage.indexedDbIfSupported('NotZero'),
    );
  });
}
