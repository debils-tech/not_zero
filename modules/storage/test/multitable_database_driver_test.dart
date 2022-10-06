import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_storage/src/drivers/multitable_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_multitable_database_driver.dart';
import 'package:sembast/sembast.dart' as sembast;

void main() {
  // Prepare the database before tests
  final MultitableDatabaseDriver collections =
      SembastMultitableDatabaseDriver(null);

  setUp(collections.init);

  tearDown(collections.drop);

  test('Dynamic collections creation', () {
    // Creating collections for the first time
    for (var i = 0; i < 5; i++) {
      final col = collections['collection_$i'];
      expect(col.name, 'collection_$i');
    }
    // Getting already created collections
    for (var i = 0; i < 3; i++) {
      final col = collections['collection_$i'];
      expect(col.name, 'collection_$i');
    }

    // Expecting that length of collections is 5 (created in the first loop)
    expect(collections.collections.length, 5);
  });

  test('Insert + Get by key', () async {
    final col = collections['test'];

    // Inserting a data
    await col.insert({'id': 'abcd', 'text': 'Hello World!'});
    // Getting a this exact data by key
    final data = await col.findByKey('abcd');

    expect(data, isNotNull);
    expect(data!['id'], 'abcd');
    expect(data['text'], 'Hello World!');
  });

  test('Insert many + Get by keys', () async {
    final col = collections['test'];

    // Inserting a data
    for (var i = 0; i < 10; i++) {
      await col.insert({'id': 'key_$i', 'text': 'Test Data $i'});
    }

    // Getting a this exact data by keys
    for (var i = 0; i < 10; i++) {
      final data = await col.findByKey('key_$i');
      expect(data, isNotNull);
      expect(data!['id'], 'key_$i');
      expect(data['text'], 'Test Data $i');
    }
  });

  test('Find all', () async {
    final col = collections['test'];

    // Inserting a data
    for (var i = 0; i < 10; i++) {
      await col.insert({'id': 'key_$i', 'text': 'Test Data $i', 'index': i});
    }

    // Getting all data (sorting is kind of necessary)
    final data = (await col.find(
      finder: sembast.Finder(sortOrders: [sembast.SortOrder('index')]),
    ))
        .toList();
    expect(data, isList);
    expect(data.length, 10);
    for (var i = 0; i < 10; i++) {
      expect(data[i]['id'], 'key_$i');
      expect(data[i]['text'], 'Test Data $i');
      expect(data[i]['index'], i);
    }
  });

  test('Find with filter', () async {
    final col = collections['test'];

    // Inserting a data
    for (var i = 0; i < 10; i++) {
      await col.insert({'id': 'key_$i', 'text': 'Test Data $i', 'index': i});
    }

    // Getting some specific record
    final data = (await col.find(
      finder: sembast.Finder(
        filter: sembast.Filter.equals('index', 5),
      ),
    ))
        .toList();

    expect(data, isList);
    expect(data.length, 1);
    expect(data[0]['id'], 'key_5');
    expect(data[0]['text'], 'Test Data 5');
    expect(data[0]['index'], 5);
  });

  test('Delete by key', () async {
    final col = collections['test'];

    // Inserting a data
    await col.insert({'id': 'abcd', 'text': 'Hello World!'});

    // Deleting this exact data by key
    await col.deleteByKey('abcd');

    // Getting a this exact data by key
    final data = await col.findByKey('abcd');

    expect(data, isNull);
  });

  test('Delete by keys', () async {
    final col = collections['test'];

    // Inserting a data
    for (var i = 0; i < 10; i++) {
      await col.insert({'id': 'key_$i', 'text': 'Test Data $i'});
    }

    // Deleting this data using keys
    for (var i = 0; i < 3; i++) {
      await col.deleteByKey('key_$i');
    }

    // Trying to get deleted data
    for (var i = 0; i < 3; i++) {
      final data = await col.findByKey('key_$i');
      expect(data, isNull);
    }
    // Trying to get saved data
    for (var i = 3; i < 10; i++) {
      final data = await col.findByKey('key_$i');
      expect(data, isNotNull);
      expect(data!['id'], 'key_$i');
      expect(data['text'], 'Test Data $i');
    }
  });

  test('Delete with filter + Count', () async {
    final col = collections['test'];

    // Inserting a data
    for (var i = 0; i < 10; i++) {
      await col.insert({'id': 'key_$i', 'text': 'Test Data $i', 'index': i});
    }

    final count1 = await col.count();
    expect(count1, 10);

    // Deleting this data using filter
    await col.delete(
      finder: sembast.Finder(
        filter: sembast.Filter.inList('index', [0, 1, 2]),
      ),
    );

    final count2 = await col.count();
    expect(count2, 7);

    // Trying to get deleted data
    for (var i = 0; i < 3; i++) {
      final data = await col.findByKey('key_$i');
      expect(data, isNull);
    }
    // Trying to get saved data
    for (var i = 3; i < 10; i++) {
      final data = await col.findByKey('key_$i');
      expect(data, isNotNull);
      expect(data!['id'], 'key_$i');
      expect(data['text'], 'Test Data $i');
    }
  });
}
