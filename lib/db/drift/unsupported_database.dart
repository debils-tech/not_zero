import 'package:drift/drift.dart';

QueryExecutor openDriftDatabase({bool permament = true}) {
  throw UnsupportedError('This platform is not supported by drift');
}

DatabaseConnection openIsolateConnection() {
  throw UnsupportedError("This platform doesn't support isolates");
}
