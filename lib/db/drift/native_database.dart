import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:not_zero/db/provider.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

QueryExecutor openDriftDatabase() {
  return LazyDatabase(() async {
    // TODO(uSlashVlad): Implement DriftIsolate for database.
    final file = File(await _getDatabasePath());
    return NativeDatabase(file);
  });
}

Future<String> _getDatabasePath() async {
  final storagePath = await StorageProvider.storageDirectory;
  return p.join(storagePath, 'db.sqlite');
}
