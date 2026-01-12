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
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

class ReminderPickerTile extends StatelessWidget {
  const ReminderPickerTile({
    required this.value,
    required this.onChanged,
    this.borderRadius,
    super.key,
  });

  final ReminderLocalTime? value;
  final void Function(ReminderLocalTime? newValue) onChanged;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final value = this.value;
    final borderRadius = this.borderRadius;

    final Widget valueIndicator;
    if (value != null) {
      valueIndicator = Row(
        mainAxisSize: .min,
        spacing: 4,
        children: [
          Text(
            '${value.hour.toString().padLeft(2, '0')}:'
            '${value.minute.toString().padLeft(2, '0')}',
            style: context.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.primary,
            ),
          ),
          IconButton(
            onPressed: () => onChanged(null),
            icon: const Icon(Icons.close_rounded),
            visualDensity: VisualDensity.compact,
          ),
        ],
      );
    } else {
      valueIndicator = Text(
        // TODO(uSlashVlad): Remove tasks translations from universal time picker!
        context.t.tasks.edit.fields.taskReminderNone,
        style: context.theme.textTheme.bodyLarge?.copyWith(
          color: context.theme.colorScheme.primary,
        ),
      );
    }

    return ListTile(
      onTap: () async {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime == null) return;

        final reminderTime = ReminderLocalTime.create(
          pickedTime.hour,
          pickedTime.minute,
        );
        onChanged(reminderTime);
      },
      // TODO(uSlashVlad): Remove tasks translations from universal time picker!
      title: Text(context.t.tasks.edit.fields.taskReminder),
      trailing: valueIndicator,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius)
          : null,
    );
  }
}
