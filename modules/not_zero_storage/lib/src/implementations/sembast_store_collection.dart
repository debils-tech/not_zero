import 'package:not_zero_storage/src/models/collection.dart';
import 'package:sembast/sembast.dart';

class SembastStoreCollection implements Collection {
  @override
  final String name;

  late final StoreRef<String, Map<String, dynamic>> _store;
  final Database db;

  @override
  final String primaryKey;

  SembastStoreCollection(this.name, this.db, {this.primaryKey = 'id'}) {
    _store = StoreRef<String, Map<String, dynamic>>(name);
  }

  @override
  Future<void> drop() {
    return _store.drop(db);
  }

  @override
  Future<Map<String, dynamic>?> findByKey(String key) {
    return _store.record(key).get(db);
  }

  @override
  Future<Iterable<Map<String, dynamic>>> find({Finder? finder}) async {
    final records = await _store.find(db, finder: finder);
    return records.map((e) => e.value).toList();
  }

  @override
  Future<void> insert(Map<String, dynamic> data) {
    final key = data[primaryKey] as String;
    return _store.record(key).put(db, data);
  }

  @override
  Future<void> deleteByKey(String key) {
    return _store.record(key).delete(db);
  }

  @override
  Future<void> delete({Finder? finder}) {
    return _store.delete(db, finder: finder);
  }

  @override
  Future<int> count({Filter? filter}) {
    return _store.count(db, filter: filter);
  }
}
