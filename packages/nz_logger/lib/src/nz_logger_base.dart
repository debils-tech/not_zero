// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
