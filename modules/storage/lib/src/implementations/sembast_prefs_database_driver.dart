import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:not_zero_storage/src/drivers/prefs_database_driver.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';
import 'package:universal_io/io.dart';

/// Implementation of [PrefsDatabaseDriver] with the use of Sembast databases.
class SembastPrefsDatabaseDriverImpl implements PrefsDatabaseDriver {
  final _store = StoreRef<String, Object>.main();
  late Database _db;

  final _cache = HashMap<String, Object>();

  @override
  Future<void> init() async {
    final DatabaseFactory factory;
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      debugPrint('Running "prefs" database in test environment');
      factory = databaseFactoryMemory;
    } else {
      factory = getDatabaseFactory();
    }
    _db = await factory.openDatabase('prefs.db');
    await _updateRecordsInCache();
  }

  Future<void> _updateRecordsInCache() async {
    final records = await _store.find(_db);
    for (final record in records) {
      _cache[record.key] = record.value;
    }
  }

  @override
  Future<void> drop() async {
    await _store.drop(_db);
    _cache.clear();
  }

  @override
  Future<void> set(String key, Object value, {bool merge = true}) {
    _cache[key] = value;
    return _store.record(key).put(_db, value, merge: merge);
  }

  @override
  Iterable<String> keys() => _cache.keys;

  @override
  Object? get(String key) {
    return _cache[key];
  }

  @override
  Future<Object?> getLazy(String key) {
    return _store.record(key).get(_db);
  }
}
