import 'package:not_zero_storage/src/models/collection.dart';

/// Abstract universal storage.
/// The only implementation is [SembastStoreCollection].
///
/// It has multitable/multicollection concept for storing dynamic data (like
/// MongoDB). Whenever you access a collection, it will be created if it does
/// not exist (thats why operator[] never returns `null`).
abstract class MultitableDatabaseDriver {
  /// Initializes the database.
  ///
  /// It creates the file if it doesn't exist, loads information about
  /// collections and fills the map of stores, connected to logical collections.
  Future<void> init();

  /// Clears all known data from the database, clears map of logical collections.
  Future<void> drop();

  /// Returns a collection by its name.
  ///
  /// If such collection does not exist, it will be created and then can be
  /// accessed in the future.
  Collection operator [](String key);

  /// Returns a list of all created collections in the database.
  Iterable<Collection> get collections;
}
