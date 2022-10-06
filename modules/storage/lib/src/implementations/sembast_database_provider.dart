import 'dart:async';

import 'package:not_zero_storage/src/database_provider.dart';
import 'package:not_zero_storage/src/drivers/multitable_database_driver.dart';
import 'package:not_zero_storage/src/drivers/prefs_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_multitable_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_prefs_database_driver.dart';

/// Implementation of [DatabaseProvider] with the use of Sembast databases.
class SembastDatabaseProvider implements DatabaseProvider {
  /// Typicaly just creates drivers instance with reference to itself.
  SembastDatabaseProvider() {
    prefs = SembastPrefsDatabaseDriverImpl(this);
    collections = SembastMultitableDatabaseDriver(this);
  }

  @override
  late PrefsDatabaseDriver prefs;

  @override
  late MultitableDatabaseDriver collections;

  @override
  Future<void> get ensureInited => _inited.future;

  final _inited = Completer<void>();

  @override
  Future<void> init() async {
    await prefs.init();
    await collections.init();

    if (!_inited.isCompleted) _inited.complete();
  }

  @override
  Future<void> drop() async {
    await prefs.drop();
    await collections.drop();
  }
}
