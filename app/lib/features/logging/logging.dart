import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

void configLogger() {
  Logger.root.level = Level.ALL;

  Logger.root.onRecord.listen(_printConsoleWrapped);
}

void _printConsoleWrapped(LogRecord record) {
  var resultingText = '${record.time} [${record.level.name.toUpperCase()}] '
      '${record.loggerName}: ';

  final logError = record.error;
  if (logError != null) {
    resultingText += '!($logError)! ';
  }

  final patternForSplit = RegExp('.{1,800}');
  final splitMessage =
      patternForSplit.allMatches(record.message).map((e) => e.group(0));
  final iter = splitMessage.iterator..moveNext();
  resultingText += '${iter.current}';

  debugPrint(resultingText);
  while (iter.moveNext()) {
    debugPrint(iter.current);
  }

  final logStackTrace = record.stackTrace;
  if (logStackTrace != null) {
    debugPrintStack(stackTrace: logStackTrace);
  }
}
