// [print] is used here without flutter package,
// so no kDebugMode or debugPrint available here.
// ignore_for_file: avoid_print

import 'package:logging/logging.dart';

void configLogger({bool production = false}) {
  Logger.root.level = production ? .INFO : .ALL;

  Logger.root.onRecord.listen(_printConsoleWrapped);
}

void _printConsoleWrapped(LogRecord record) {
  var resultingText =
      '${record.time} [${record.level.name.toUpperCase()}] '
      '${record.loggerName}: ';

  final logError = record.error;
  if (logError != null) {
    resultingText += '!($logError)! ';
  }

  final patternForSplit = RegExp('.{1,800}');
  final splitMessage = patternForSplit
      .allMatches(record.message)
      .map((e) => e.group(0));
  final iter = splitMessage.iterator..moveNext();
  resultingText += '${iter.current}';

  print(resultingText);
  while (iter.moveNext()) {
    print(iter.current);
  }

  final logStackTrace = record.stackTrace;
  if (logStackTrace != null) {
    print(logStackTrace);
  }
}
