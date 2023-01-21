import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor openDriftDatabase({bool permament = true}) {
  if (permament) {
    return LazyDatabase(() async {
      return WebDatabase.withStorage(
        await DriftWebStorage.indexedDbIfSupported('NotZero'),
      );
    });
  }

  return WebDatabase('NotZero');
}

DatabaseConnection openIsolateConnection() {
  throw UnsupportedError("Flutter web doesn't support isolates");
}
