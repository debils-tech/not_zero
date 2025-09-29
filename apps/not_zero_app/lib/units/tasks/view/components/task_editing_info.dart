import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TaskEditingInfo extends StatelessWidget {
  const TaskEditingInfo(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.titleSmall;

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
