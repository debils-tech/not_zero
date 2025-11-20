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

import 'package:flutter/material.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class FancyDatePickerButton extends StatelessWidget {
  const FancyDatePickerButton({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final DateTime? value;
  final ValueSetter<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final dateValue = value;

    if (dateValue != null) {
      return FilledButton.tonalIcon(
        onPressed: () => _selectDay(context),
        style: FilledButton.styleFrom(padding: const .all(16)),
        icon: const Icon(Icons.calendar_today_rounded),
        label: Text(
          NzDateTimeFormat.relativeLocalFormat(context, dateValue),
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: () => _selectDay(context),
      style: OutlinedButton.styleFrom(padding: const .all(16)),
      icon: const Icon(Icons.alarm_off_rounded),
      label: Text(context.t.tasks.edit.fields.taskForSomeday),
    );
  }

  Future<void> _selectDay(BuildContext context) async {
    final today = DateTime.now();
    final pickedDate = value;

    // TODO(uSlashVlad): Maybe it would be better to place date picker in the navigation as a usual dialog page?
    final newValue = await showDatePicker(
      context: context,
      // TODO(uSlashVlad): Couldn't pick date in the past, maybe some fix needed
      initialDate: pickedDate != null && today.isAfter(pickedDate)
          ? today
          : pickedDate,
      currentDate: today,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );

    if (newValue == null) return;
    onChanged(newValue);
  }
}
