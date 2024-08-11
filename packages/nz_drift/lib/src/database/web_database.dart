// coverage:ignore-file
import 'package:drift/drift.dart';
import 'package:drift/web.dart';

QueryExecutor openDriftDatabase({bool permanent = true}) {
  if (permanent) {
    return LazyDatabase(() async {
      return WebDatabase.withStorage(
        await DriftWebStorage.indexedDbIfSupported('NotZero'),
        logStatements: true,
      );
    });
  }

  return WebDatabase('NotZero');
}

Future<String?> getDatabasePath() async => null;
