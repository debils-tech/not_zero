// coverage:ignore-file
import 'package:drift/drift.dart';

QueryExecutor openDriftDatabase({bool permament = true}) =>
    throw UnsupportedError('This platform is not supported by drift');

Future<String?> getDatabasePath() =>
    throw UnsupportedError('This platform is not supported by drift');
