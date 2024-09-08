// coverage:ignore-file
export 'unsupported_database.dart'
    if (dart.library.ffi) 'native_database.dart'
    if (dart.library.html) 'web_database.dart';
