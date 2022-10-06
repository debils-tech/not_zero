// ignore_for_file: public_member_api_docs

import 'package:not_zero_storage/src/database_provider.dart';
import 'package:not_zero_storage/src/models/collection.dart';
import 'package:sembast/sembast.dart';

class SembastStoreCollection implements Collection {
  SembastStoreCollection(
    this._dbProviderRef,
    this.name,
    this._db, {
    this.primaryKey = 'id',
  }) {
    _store = StoreRef<String, Map<String, dynamic>>(name);
  }

  /// This is needed for checking if database is fully ready before storing
  /// anything in it.
  final DatabaseProvider? _dbProviderRef;

  @override
  final String name;

  late final StoreRef<String, Map<String, dynamic>> _store;
  final Database _db;

  @override
  final String primaryKey;

  @override
  Future<void> drop() {
    return _store.drop(_db);
  }

  @override
  Future<Map<String, dynamic>?> findByKey(String key) async {
    await _dbProviderRef?.ensureInited;
    return _store.record(key).get(_db);
  }

  @override
  Future<Iterable<Map<String, dynamic>>> find({Finder? finder}) async {
    await _dbProviderRef?.ensureInited;
    final records = await _store.find(_db, finder: finder);
    return records.map((e) => e.value).toList();
  }

  @override
  Future<void> insert(Map<String, dynamic> data) async {
    await _dbProviderRef?.ensureInited;
    final key = data[primaryKey] as String;
    await _store.record(key).put(_db, data);
  }

  @override
  Future<void> deleteByKey(String key) async {
    await _dbProviderRef?.ensureInited;
    await _store.record(key).delete(_db);
  }

  @override
  Future<void> deleteByKeys(Iterable<String> keys) async {
    await _dbProviderRef?.ensureInited;
    await _store.records(keys).delete(_db);
  }

  @override
  Future<void> delete({Finder? finder}) async {
    await _dbProviderRef?.ensureInited;
    await _store.delete(_db, finder: finder);
  }

  @override
  Future<int> count({Filter? filter}) async {
    await _dbProviderRef?.ensureInited;
    return _store.count(_db, filter: filter);
  }
}
