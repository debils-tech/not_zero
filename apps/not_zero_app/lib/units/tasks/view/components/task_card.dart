import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/units/tags/view/tag_list_indicator.dart';
import 'package:not_zero_app/units/tasks/di.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: task.isCompleted ? 0.5 : 1,
      child: SelectableCard(
        onTap: () => context.push('/tasks/view/${task.id}', extra: task),
        identifier: task.id,
        child: _ImportanceIndicatorBox(
          importance: task.importance,
          child: Row(
            children: [
              const SizedBox(width: 15),
              Flexible(
                fit: FlexFit.tight,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        SizedBox(
          height: 20,
          child: _TaskTimeText(task),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 8),
          child: TagListIndicator(tags: task.tags),
        ),
        Text(
          task.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        if (task.description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Text(
              task.description,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
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

    final ts = t.common.timeSubtitle;
    final String finalTextTime;
    if (task.isCompleted) {
      finalTextTime = ts.completedAt(time: formattedTime);
    } else if (task.modifiedAt != null) {
      finalTextTime = ts.modifiedAt(time: formattedTime);
    } else {
      finalTextTime = ts.createdAt(time: formattedTime);
    }

    final textStyle = Theme.of(context).textTheme.labelMedium;
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
              Theme.of(context).tasksColorScheme,
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
    TaskImportance.notImportant => colorScheme.notImportantColor,
    TaskImportance.normal => colorScheme.normalColor,
    TaskImportance.important => colorScheme.importantColor,
  };
}

class _TaskCheckbox extends ConsumerWidget {
  const _TaskCheckbox({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: task.isCompleted,
        shape: const CircleBorder(),
        onChanged: (value) => ref
            .read(tasksRepositoryProvider)
            .updateTask(
              task.complete(completed: value ?? false),
            ),
      ),
    );
  }
}
