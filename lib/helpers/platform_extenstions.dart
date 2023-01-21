import 'package:universal_io/io.dart';

/// Checks if code is running using `flutter test` or not.
///
/// Mainly used by DB code since it has
/// several problems with paths and isolates.
final isPlatformTest = Platform.environment.containsKey('FLUTTER_TEST');
