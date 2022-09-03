import 'package:not_zero_storage/not_zero_database.dart';
import 'package:not_zero_storage/src/implementations/sembast_store_collection.dart';
import 'package:tekartik_app_flutter_sembast/sembast.dart';

class SembastMultitableDatabaseDriver implements MultitableDatabaseDriver {
  late Database _db;

  final _mainStore = StoreRef<String, Object>.main();

  final _logicalCollections = <String, SembastStoreCollection>{};

  @override
  Future<void> init() async {
    _db = await getDatabaseFactory().openDatabase('collections.db');

    final collectionsInfo = await _mainStore.record('collections').get(_db);
    final collectionsList = (collectionsInfo as List<String>?) ?? [];
    for (final c in collectionsList) {
      _logicalCollections[c] = SembastStoreCollection(c, _db);
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

    SembastStoreCollection? collection = _logicalCollections[name];
    if (collection != null) {
      // If such collection is already exists
      return collection;
    } else {
      // In other case, create this collection
      _mainStore.record('collections').put(_db, [name], merge: true);
      collection = SembastStoreCollection(name, _db);
      _logicalCollections[name] = collection;
      return collection;
    }
  }

  @override
  Iterable<Collection> get collections => _logicalCollections.values;
}
