import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor openDriftDatabase() {
  return LazyDatabase(() async {
    return WebDatabase.withStorage(
      await DriftWebStorage.indexedDbIfSupported('NotZero'),
    );
  });
}

DatabaseConnection openIsolateConnection() {
  throw UnsupportedError("Flutter web doesn't support isolates");
}
