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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/tags/view/tag_list_indicator.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: task.isCompleted || task.isCanceled ? 0.5 : 1,
      child: SelectableCard(
        onTap: () => context.push('/tasks/view/${task.id}', extra: task),
        identifier: task.id,
        child: _ImportanceIndicatorBox(
          importance: task.importance,
          child: Row(
            children: [
              const SizedBox(width: 15),
              Flexible(
                fit: .tight,
                child: _TaskTextBlock(task: task),
              ),
              const SizedBox(width: 12),
              _TaskCheckbox(task: task),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskTextBlock extends StatelessWidget {
  const _TaskTextBlock({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: .start,
      children: [
        const SizedBox(height: 2),
        SizedBox(
          height: 20,
          child: _TaskTimeText(task),
        ),
        Padding(
          padding: const .only(top: 2, bottom: 8),
          child: TagListIndicator(tags: task.tags),
        ),
        Text(
          task.title,
          overflow: .ellipsis,
          maxLines: 3,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: .w600,
            decoration: task.isCanceled ? .lineThrough : null,
            decorationThickness: 2.5,
          ),
        ),
        const SizedBox(height: 4),
        if (task.description.isNotEmpty)
          Padding(
            padding: const .symmetric(
              horizontal: 4,
            ),
            child: Text(
              task.description,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: .w500,
              ),
              overflow: .ellipsis,
              maxLines: 4,
            ),
          ),
        const SizedBox(height: 6),
      ],
    );
  }
}

class _TaskTimeText extends StatelessWidget {
  const _TaskTimeText(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final timeToShow = task.completedAt ?? task.modifiedAt ?? task.createdAt;

    final formattedTime = NzDateTimeFormat.localFormat(timeToShow);

    final ts = context.t.common.timeSubtitle;
    final String finalTextTime;
    if (task.isCompleted) {
      finalTextTime = ts.completedAt(time: formattedTime);
    } else if (task.modifiedAt != null) {
      finalTextTime = ts.modifiedAt(time: formattedTime);
    } else {
      finalTextTime = ts.createdAt(time: formattedTime);
    }

    final textStyle = context.theme.textTheme.labelMedium;
    return Text(
      finalTextTime,
      style: textStyle?.copyWith(
        color: textStyle.color?.withValues(alpha: 0.6),
      ),
    );
  }
}

class _ImportanceIndicatorBox extends StatelessWidget {
  const _ImportanceIndicatorBox({
    required this.importance,
    required this.child,
  });

  final TaskImportance importance;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 7,
            color: _colorByImportance(
              importance,
              context.theme.tasksColorScheme,
            ),
          ),
        ),
      ),
      child: child,
    );
  }

  Color _colorByImportance(
    TaskImportance importance,
    TasksColorScheme colorScheme,
  ) => switch (importance) {
    .notImportant => colorScheme.notImportantColor,
    .normal => colorScheme.normalColor,
    .important => colorScheme.importantColor,
  };
}

class _TaskCheckbox extends ConsumerWidget {
  const _TaskCheckbox({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(
      !task.isCompleted || !task.isCanceled,
      "Task can't be canceled and completed at the same time",
    );

    if (task.isCanceled) {
      // State of checkbox widget when task is canceled
      return TextButton.icon(
        onPressed: () => ref
            .read(tasksMainListNotifier.notifier)
            .updateTask(task.complete(completed: false)),
        icon: const Icon(
          Icons.cancel_outlined,
          size: 20,
        ),
        label: Text(context.t.tasks.list.canceledTaskMark),
      );
    }

    if (task.forDate == null) {
      // State of checkbox widget when task is not scheduled for a specific date
      return IconButton.outlined(
        onPressed: () async {
          final firstDate = DateTime.now();
          final lastDate = firstDate.add(const Duration(days: 365));
          final newDate = await showDatePicker(
            context: context,
            initialDate: firstDate,
            firstDate: firstDate,
            lastDate: lastDate,
          );
          if (newDate == null) return;

          unawaited(
            ref
                .read(tasksMainListNotifier.notifier)
                .updateTask(task.copyWith(forDate: newDate)),
          );
        },
        icon: const Icon(
          Icons.calendar_today_rounded,
          size: 20,
        ),
        tooltip: context.t.tasks.list.tooltips.selectDateForSomedayTasksButton,
      );
    }

    // The most normal state of a task checkbox widget (actual checkbox)
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: task.isCompleted,
        shape: const CircleBorder(),
        onChanged: (value) => ref
            .read(tasksMainListNotifier.notifier)
            .updateTask(task.complete(completed: value ?? false)),
      ),
    );
  }
}
