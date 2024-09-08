abstract interface class NotZeroBox<T> {
  Future<void> init();

  Future<void> dispose();

  T? value(String key);

  Future<void> put(String key, T value);

  Future<void> putAll(Map<String, T> values);

  Future<void> clear(String key);

  Future<void> clearAll();

  Map<String, T> dump();

  Future<void> deleteBox();
}
