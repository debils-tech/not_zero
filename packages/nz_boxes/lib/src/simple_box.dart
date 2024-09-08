import 'package:nz_boxes/src/not_zero_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotZeroSimpleBox implements NotZeroBox<String> {
  final String _boxName;

  late SharedPreferencesWithCache _prefs;

  NotZeroSimpleBox(this._boxName);

  @override
  Future<void> init() async {
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  @override
  Future<void> dispose() async {}

  @override
  String? value(String key) => _get(key);

  @override
  Future<void> put(String key, String value) => _set(key, value);

  @override
  Future<void> putAll(Map<String, String> values) async {
    for (final entry in values.entries) {
      await _set(entry.key, entry.value);
    }
  }

  @override
  Future<void> clear(String key) => _remove(key);

  @override
  Future<void> clearAll() async {
    for (final key in _keys) {
      _prefs.remove(key);
    }
  }

  @override
  Map<String, String> dump() {
    final data = <String, String>{};

    for (final key in _keys) {
      final value = _prefs.getString(key);
      if (value != null) {
        data[key] = value;
      }
    }

    return data;
  }

  @override
  Future<void> deleteBox() => clearAll();

  String? _get(String key) {
    return _prefs.getString(_key(key));
  }

  Future<void> _set(String key, String value) {
    return _prefs.setString(_key(key), value);
  }

  Future<void> _remove(String key) {
    return _prefs.remove(_key(key));
  }

  Set<String> get _keys =>
      _prefs.keys.where((key) => key.startsWith(_boxName)).toSet();

  String _key(String key) {
    if (_boxName.isEmpty) return key;
    return '${_boxName}_$key';
  }
}
