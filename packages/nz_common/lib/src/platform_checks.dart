import 'dart:io';

/// Checks if code is running using `flutter test` or not.
///
/// Mainly used by DB code since it has
/// several problems with paths and isolates.
final isPlatformTest = Platform.environment.containsKey('FLUTTER_TEST');

final isPlatformDesktop =
    Platform.isLinux || Platform.isMacOS || Platform.isWindows;

final isPlatformMobile = Platform.isAndroid || Platform.isIOS;
