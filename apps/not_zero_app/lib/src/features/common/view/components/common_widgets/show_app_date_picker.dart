// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/utils/first_day_localizations.dart';

Future<DateTime?> showAppDatePicker({
  required BuildContext context,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? initialDate,
  DateTime? currentDate,
}) {
  final container = ProviderScope.containerOf(context, listen: false);
  final firstWeekday = container.read(effectiveFirstWeekdayProvider);

  return showDatePicker(
    context: context,
    initialDate: initialDate,
    currentDate: currentDate,
    firstDate: firstDate,
    lastDate: lastDate,
    builder: (context, child) {
      return Localizations.override(
        context: context,
        delegates: [
          FirstDayLocalizationsDelegate(
            firstWeekday % DateTime.daysPerWeek,
          ),
        ],
        child: child ?? const SizedBox.shrink(),
      );
    },
  );
}
