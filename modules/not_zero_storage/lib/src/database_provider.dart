import 'package:not_zero_storage/src/drivers/multitable_database_driver.dart';
import 'package:not_zero_storage/src/drivers/prefs_database_driver.dart';
import 'package:not_zero_storage/src/implementations/sembast_database_provider.dart';

/// Abstract class providing access to basic database functions.
/// The only implementation is [SembastDatabaseProvider].
///
/// Example:
/// ```dart
/// // Initing database
/// final db = DatabaseProvider.sembast();
/// await db.init();
///
/// // ...
///
/// // Setting new values into key-value storage
/// await db.prefs.set('settings-app-theme', 'dark');
/// await db.prefs.set('stats-tap-amount', 10);
/// ```
abstract class DatabaseProvider {
  /// Getter allowing to gain the access to simple key-value storage.
  PrefsDatabaseDriver get prefs;

  MultitableDatabaseDriver get collections;

  /// Initializing the database.
  ///
  /// In case of [SembastDatabaseProvider], it just creates the file if it
  /// doesn't exist and cache all the values in prefs.
  Future<void> init();

  /// Dropping the database.
  ///
  /// Removes all the files related to database, clears all database cache.
  /// This action can't be undone, data will be lost forever.
  Future<void> drop();

  factory DatabaseProvider.sembast() => SembastDatabaseProvider();
}
