import 'package:logging/logging.dart';
import 'package:nz_boxes/src/not_zero_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotZeroSimpleBox implements NotZeroBox<String> {
  NotZeroSimpleBox(this._boxName)
    : _log = Logger('NotZeroSimpleBox($_boxName)');

  final String _boxName;

  SharedPreferencesWithCache? _prefs;

  final Logger _log;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
  }

  @override
  Future<void> dispose() async {}

  String? getString(String key, {String? defaultValue}) {
    _logIfNotInitBox();
    return _prefs?.getString(key) ?? defaultValue;
  }

  int? getInt(String key, {int? defaultValue}) {
    _logIfNotInitBox();
    return _prefs?.getInt(key) ?? defaultValue;
  }

  bool? getBool(String key, {bool? defaultValue}) {
    _logIfNotInitBox();
    return _prefs?.getBool(key) ?? defaultValue;
  }

  @Deprecated('[value] method was deprecated, use [getString] instead')
  @override
  String? value(String key) => getString(key);

  Future<void> putString(String key, String value) {
    _logIfNotInitBox();
    return _prefs?.setString(key, value) ?? Future.value();
  }

  Future<void> putInt(String key, int value) {
    _logIfNotInitBox();
    return _prefs?.setInt(key, value) ?? Future.value();
  }

  Future<void> putBool(String key, bool value) {
    _logIfNotInitBox();
    return _prefs?.setBool(key, value) ?? Future.value();
  }

  @Deprecated('Do not use this method, use [putString] instead')
  @override
  Future<void> put(String key, String value) => putString(key, value);

  @override
  Future<void> putAll(Map<String, String> values) async {
    for (final entry in values.entries) {
      await putString(entry.key, entry.value);
    }
  }

  @override
  Future<void> clear(String key) => _remove(key);

  @override
  Future<void> clearAll() async {
    _logIfNotInitBox();
    for (final key in _keys) {
      await _prefs?.remove(key);
    }
  }

  @override
  Map<String, String> dump() {
    _logIfNotInitBox();
    final data = <String, String>{};

    for (final key in _keys) {
      final value = _prefs?.getString(key);
      if (value != null) {
        data[key] = value;
      }
    }

    return data;
  }

  @override
  Future<void> deleteBox() => clearAll();

  Future<void> _remove(String key) {
    _logIfNotInitBox();
    return _prefs?.remove(_key(key)) ?? Future.value();
  }

  Set<String> get _keys =>
      _prefs?.keys.where((key) => key.startsWith(_boxName)).toSet() ?? {};

  String _key(String key) {
    if (_boxName.isEmpty) return key;
    return '${_boxName}_$key';
  }

  void _logIfNotInitBox() {
    if (_prefs == null) {
      _log.severe('Box not initialized');
    }
  }
}
