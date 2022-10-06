// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:not_zero_storage/not_zero_database.dart';
import 'package:not_zero_storage/src/implementations/sembast_store_collection.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';
import 'package:universal_io/io.dart';

class SembastMultitableDatabaseDriver implements MultitableDatabaseDriver {
  /// Accepts only [DatabaseProvider] that should be a "parent" of this driver
  /// instance.
  SembastMultitableDatabaseDriver(this._dbProviderRef);

  /// This is needed for checking if database is fully ready before storing
  /// anything in it.
  final DatabaseProvider? _dbProviderRef;

  late Database _db;

  final _mainStore = StoreRef<String, Object>.main();

  final _logicalCollections = <String, SembastStoreCollection>{};

  @override
  Future<void> init() async {
    final DatabaseFactory factory;
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      debugPrint('Running "collections" database in test environment');
      factory = databaseFactoryMemory;
    } else {
      factory = getDatabaseFactory();
    }
    _db = await factory.openDatabase('collections.db');

    final collectionsInfo = await _mainStore.record('collections').get(_db);
    final collectionsList = collectionsInfo != null
        ? List<String>.from(collectionsInfo as Iterable)
        : <String>[];
    for (final c in collectionsList) {
      _logicalCollections[c] = SembastStoreCollection(_dbProviderRef, c, _db);
    }
  }

  @override
  Future<void> drop() async {
    for (final c in _logicalCollections.values) {
      await c.drop();
    }
    _logicalCollections.clear();
    await _mainStore.drop(_db);
  }

  @override
  Collection operator [](String name) {
    if (name.startsWith('_')) {
      throw ArgumentError.value(
        name,
        'name',
        'Any collection name that starts with "_" is reserved',
      );
    }

    var collection = _logicalCollections[name];
    if (collection != null) {
      // If such collection is already exists
      return collection;
    } else {
      // In other case, create this collection
      _mainStore.record('collections').put(_db, [name], merge: true);
      collection = SembastStoreCollection(_dbProviderRef, name, _db);
      _logicalCollections[name] = collection;
      return collection;
    }
  }

  @override
  Iterable<Collection> get collections => _logicalCollections.values;
}
