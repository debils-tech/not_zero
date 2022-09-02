/// Submodule of "Not Zero" app, providing it with a ways of storing persistent
/// data.
///
/// It commonly uses [Sembast](https://pub.dev/packages/sembast) package as
/// database, but provides specific abstract layer on top, so it can be easily
/// replaced with another package.
library not_zero_storage;

export 'src/database_provider.dart';
export 'src/drivers/multitable_database_driver.dart';
export 'src/drivers/prefs_database_driver.dart';
export 'src/models/collection.dart';
