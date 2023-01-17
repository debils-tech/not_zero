// Relative imports are usefull here because of conditional imports.
// ignore: always_use_package_imports
export 'unsupported_database.dart'
    if (dart.library.ffi) 'native_database.dart'
    if (dart.library.html) 'web_database.dart';
