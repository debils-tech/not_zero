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
import 'package:intl/intl.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TaskEditingInfo extends StatelessWidget {
  const TaskEditingInfo(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme.titleSmall;

    final timeFormat = DateFormat.Hm();
    final dateFormat = DateFormat.yMMMMd();
    final createAtDate =
        '${timeFormat.format(task.createdAt)}'
        ' '
        '${dateFormat.format(task.createdAt)}';
    final modifiedAtDate = task.modifiedAt != null
        ? '${timeFormat.format(task.modifiedAt!)}'
              ' '
              '${dateFormat.format(task.modifiedAt!)}'
        : null;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          context.t.common.timeSubtitle.createdAt(time: createAtDate),
          style: textTheme,
        ),
        const SizedBox(height: 2),
        if (modifiedAtDate != null)
          Text(
            context.t.common.timeSubtitle.modifiedAt(time: modifiedAtDate),
            style: textTheme,
          ),
      ],
    );
  }
}
