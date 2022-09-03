import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_storage/src/database_provider.dart';

void main() {
  final db = DatabaseProvider.sembast();

  // Test the database
  test('Init-write-drop cycle', () async {
    await db.init();

    // Save something into prefs
    await db.prefs.set('theme', 'dark');

    // Get a collection (also writes a data into key-value storage)
    final collection = db.collections['test'];
    await collection.insert({'id': '1', 'name': 'Hello World!'});

    await db.drop();
  });
}
