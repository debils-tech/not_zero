import 'package:hive_flutter/hive_flutter.dart';
import 'package:nz_boxes/src/not_zero_box.dart';
import 'package:nz_common/nz_common.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class NotZeroSimpleBox implements NotZeroBox<String> {
  final String _boxName;

  late final Box<String> _hiveBox = Hive.box<String>(_boxName);

  NotZeroSimpleBox(this._boxName);

  @override
  Future<void> init() async {
    final dbDir = await _databasePath;
    await Hive.initFlutter(dbDir);
    await Hive.openBox<String>(_boxName);
  }

  Future<String> get _databasePath async {
    if (Platform.isLinux && !isPlatformTest) {
      return p.join(
        Platform.environment['HOME'] ?? '~',
        '.config/not_zero',
      );
    } else {
      return (await getApplicationDocumentsDirectory()).path;
    }
  }

  @override
  Future<void> dispose() {
    return _hiveBox.close();
  }

  @override
  String? value(String key) {
    return _hiveBox.get(key);
  }

  @override
  Future<void> put(String key, String value) {
    return _hiveBox.put(key, value);
  }

  @override
  Future<void> putAll(Map<String, String> values) {
    return _hiveBox.putAll(values);
  }

  @override
  Future<void> clear(String key) {
    return _hiveBox.delete(key);
  }

  @override
  Future<void> clearAll() {
    return _hiveBox.clear();
  }

  @override
  Map<String, String> dump() {
    return _hiveBox.toMap().cast();
  }

  @override
  Future<void> deleteBox() {
    return _hiveBox.deleteFromDisk();
  }
}
