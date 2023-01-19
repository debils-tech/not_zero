import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:not_zero/db/provider.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

QueryExecutor openDriftDatabase() {
  return LazyDatabase(() async {
    final file = File(await _getDatabasePath());
    return NativeDatabase(file);
  });
}

Future<String> _getDatabasePath() async {
  final storagePath = await StorageProvider.storageDirectory;
  return p.join(storagePath, 'db.sqlite');
}

DatabaseConnection openIsolateConnection() {
  return DatabaseConnection.delayed(_startIsolateConnection());
}

Future<DatabaseConnection> _startIsolateConnection() async {
  final DriftIsolate isolate;
  if (Platform.isAndroid || Platform.isIOS) {
    // Platform channels is not supported in background thread on mobile:
    // https://drift.simonbinder.eu/docs/advanced-features/isolates/#initialization-on-the-main-thread
    isolate = await _createIsolateFromMainThread();
  } else {
    isolate =
        await DriftIsolate.spawn(() => DatabaseConnection(openDriftDatabase()));
  }

  return isolate.connect(singleClientMode: true);
}

Future<DriftIsolate> _createIsolateFromMainThread() async {
  final path = await _getDatabasePath();
  final receivePort = ReceivePort();

  await Isolate.spawn<_IsolateStartRequest>(
    (message) {
      final db = NativeDatabase(File(message.targetPath));
      final isolate = DriftIsolate.inCurrent(() => DatabaseConnection(db));
      message.sendDriftIsolate.send(isolate);
    },
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  return await receivePort.first as DriftIsolate;
}

class _IsolateStartRequest {
  _IsolateStartRequest(this.sendDriftIsolate, this.targetPath);

  final SendPort sendDriftIsolate;
  final String targetPath;
}
