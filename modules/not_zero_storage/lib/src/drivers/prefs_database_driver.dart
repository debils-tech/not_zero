/// Abstract key value storage.
/// The only implementation is [SembastPrefsDatabaseDriver].
///
/// It has the most basic get-set functionality but with caching of data for
/// synchronous access to data.
abstract class PrefsDatabaseDriver {
  /// Initializes the database.
  ///
  /// It creates the file if it doesn't exist, loads all values into cache so
  /// you can synchronously access it using `get` method.
  Future<void> init();

  /// Clears all known data from the database, clears cache.
  Future<void> drop();

  /// Sets a value by its key in persistent storage (adds this exact value to
  /// the cache).
  Future<void> set(String key, Object value);

  /// Returns list of all keys in the database.
  Iterable<String> keys();

  /// Returns a value by its key from the cache.
  Object? get(String key);

  /// Returns a value by its key from the persistent storage.
  Future<Object?> getLazy(String key);
}
