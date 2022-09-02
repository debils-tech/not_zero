import 'package:not_zero_storage/src/database_provider.dart';
import 'package:not_zero_storage/src/drivers/multitable_database_driver.dart';
import 'package:not_zero_storage/src/drivers/prefs_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_multitable_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_prefs_database_driver.dart';

/// Implementation of [DatabaseProvider] with the use of Sembast databases.
class SembastDatabaseProvider implements DatabaseProvider {
  @override
  PrefsDatabaseDriver prefs = SembastPrefsDatabaseDriverImpl();

  @override
  MultitableDatabaseDriver collections = SembastMultitableDatabaseDriver();

  @override
  Future<void> init() {
    return prefs.init();
  }

  @override
  Future<void> drop() {
    return prefs.drop();
  }
}
