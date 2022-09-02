import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_storage/src/database_provider.dart';

void typicalDatabaseTest(DatabaseProvider db) {
  // Preparation of the database for tests
  setUp(db.init);

  tearDown(db.drop);

  // Testing key-value storage
  group('Prefs', () {
    test('String', () => _testPrimitiveValue<String>(db, 'test'));

    test('Int positive', () => _testPrimitiveValue<int>(db, 1337));

    test('Int negative', () => _testPrimitiveValue<int>(db, -10000000));

    test('Double', () => _testPrimitiveValue<double>(db, 13.37));

    test('Bool', () => _testPrimitiveValue<bool>(db, true));

    test('Bool rewrite', () async {
      await _testPrimitiveValue<bool>(db, true);
      await _testPrimitiveValue<bool>(db, false);
      await _testPrimitiveValue<bool>(db, true);
    });

    test('List', () async {
      const value = [1, 2, 3, '1', '12', '123'];

      await db.prefs.set('key', value);

      var dbValue = db.prefs.get('key');
      expect(dbValue, isList);
      expect(listEquals(value, dbValue as List), true);

      dbValue = await db.prefs.getLazy('key');
      expect(dbValue, isList);
      expect(listEquals(value, dbValue as List), true);
    });

    test('Map', () async {
      const value = {'id': 1, 'hello': 'world!', 'foo': 'bar'};

      await db.prefs.set('key', value);

      var dbValue = db.prefs.get('key');
      expect(dbValue, isMap);
      expect(mapEquals(value, dbValue as Map), true);

      dbValue = await db.prefs.getLazy('key');
      expect(dbValue, isMap);
      expect(mapEquals(value, dbValue as Map), true);
    });

    test('Many rewrites', () async {
      for (var i = 0; i < 50; i++) {
        await _testPrimitiveValue<int>(
          db,
          i,
          key: i % 5 == 0 ? 'key$i' : 'default-key',
        );
      }
    });
  });
}

Future<void> _testPrimitiveValue<T>(
  DatabaseProvider db,
  T value, {
  String key = 'key',
}) async {
  assert(T == String || T == int || T == double || T == bool);

  await db.prefs.set(key, value as Object);

  var dbValue = db.prefs.get(key)!;
  expect(dbValue, isA<T>());
  expect(dbValue, value);

  dbValue = (await db.prefs.getLazy(key))!;
  expect(dbValue, isA<T>());
  expect(dbValue, value);
}
