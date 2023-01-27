import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void configLogger() {
  Logger.root.level = Level.ALL;

  if (kDebugMode || kProfileMode) {
    Logger.root.onRecord.listen(_printConsoleWrapped);
  }
}

void _printConsoleWrapped(LogRecord record) {
  final formattedLog = record.toString();
  final pattern = RegExp('.{1,800}');
  for (final match in pattern.allMatches(formattedLog)) {
    debugPrint(match.group(0));
  }
}
