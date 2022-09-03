import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_storage/src/drivers/prefs_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_prefs_database_driver.dart';

void main() {
  // Prepare the database before tests
  final PrefsDatabaseDriver prefs = SembastPrefsDatabaseDriverImpl();

  setUp(prefs.init);

  tearDown(prefs.drop);

  // Test the database on primitive values
  test('String', () => _testPrimitiveValue<String>(prefs, 'test'));

  test('Int positive', () => _testPrimitiveValue<int>(prefs, 1337));

  test('Int negative', () => _testPrimitiveValue<int>(prefs, -10000000));

  test('Double', () => _testPrimitiveValue<double>(prefs, 13.37));

  test('Bool', () => _testPrimitiveValue<bool>(prefs, true));

  test('Bool rewrite', () async {
    await _testPrimitiveValue<bool>(prefs, true);
    await _testPrimitiveValue<bool>(prefs, false);
    await _testPrimitiveValue<bool>(prefs, true);
  });

  // Test the database on compound values
  test('List', () async {
    const value = [1, 2, 3, '1', '12', '123'];

    await prefs.set('key', value);

    var dbValue = prefs.get('key');
    expect(dbValue, isList);
    expect(listEquals(value, dbValue as List), true);

    dbValue = await prefs.getLazy('key');
    expect(dbValue, isList);
    expect(listEquals(value, dbValue as List), true);
  });

  test('Map', () async {
    const value = {'id': 1, 'hello': 'world!', 'foo': 'bar'};

    await prefs.set('key', value);

    var dbValue = prefs.get('key');
    expect(dbValue, isMap);
    expect(mapEquals(value, dbValue as Map), true);

    dbValue = await prefs.getLazy('key');
    expect(dbValue, isMap);
    expect(mapEquals(value, dbValue as Map), true);
  });

  // More "extreme" tests
  test('Many rewrites', () async {
    for (var i = 0; i < 50; i++) {
      await _testPrimitiveValue<int>(
        prefs,
        i,
        key: i % 5 == 0 ? 'key$i' : 'default-key',
      );
    }
  });
}

Future<void> _testPrimitiveValue<T>(
  PrefsDatabaseDriver prefs,
  T value, {
  String key = 'key',
}) async {
  assert(T == String || T == int || T == double || T == bool);

  await prefs.set(key, value as Object);

  var dbValue = prefs.get(key)!;
  expect(dbValue, isA<T>());
  expect(dbValue, value);

  dbValue = (await prefs.getLazy(key))!;
  expect(dbValue, isA<T>());
  expect(dbValue, value);
}
