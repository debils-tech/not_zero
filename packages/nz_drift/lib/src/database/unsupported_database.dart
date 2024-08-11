// coverage:ignore-file
import 'package:drift/drift.dart';

QueryExecutor openDriftDatabase({bool permanent = true}) =>
    throw UnsupportedError('This platform is not supported by drift');

Future<String?> getDatabasePath() =>
    throw UnsupportedError('This platform is not supported by drift');
