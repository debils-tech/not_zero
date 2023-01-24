import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

class TaskEditingInfo extends StatelessWidget {
  const TaskEditingInfo(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subtitle2;

    final timeFormat = DateFormat.Hm();
    final dateFormat = DateFormat.yMMMMd();
    final createAtDate = '${timeFormat.format(task.createdAt)}'
        ' '
        '${dateFormat.format(task.createdAt)}';
    final modifiedAtDate = task.modifiedAt != null
        ? '${timeFormat.format(task.modifiedAt!)}'
            ' '
            '${dateFormat.format(task.modifiedAt!)}'
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.common.timeSubtitle.createdAt(time: createAtDate),
          style: textTheme,
        ),
        const SizedBox(height: 2),
        if (modifiedAtDate != null)
          Text(
            t.common.timeSubtitle.modifiedAt(time: modifiedAtDate),
            style: textTheme,
          ),
      ],
    );
  }
}
