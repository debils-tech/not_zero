import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:not_zero/db/drift/open_database.dart';

DatabaseConnection openIsolateConnection() {
  return DatabaseConnection.delayed(_startIsolateConnection());
}

Future<DatabaseConnection> _startIsolateConnection() async {
  final isolate =
      await DriftIsolate.spawn(() => DatabaseConnection(openDriftDatabase()));
  return isolate.connect(singleClientMode: true);
}
