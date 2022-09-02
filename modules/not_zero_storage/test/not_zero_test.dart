import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero_storage/src/database_provider.dart';

import 'typical_database_testing.dart';

void main() {
  group('Sembast DB test', () {
    typicalDatabaseTest(DatabaseProvider.sembast());
  });
}
