import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/selection/widgets/selectable_card.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/helpers/time.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/tasks_list_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_bloc.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final taskColors = theme.extension<TaskColors>()!;

    final Color colorByImportance;
    switch (task.importance) {
      case TaskImportance.notImportant:
        colorByImportance = taskColors.notImportantColor;
        break;
      case TaskImportance.normal:
        colorByImportance = taskColors.normalColor;
        break;
      case TaskImportance.important:
        colorByImportance = taskColors.importantColor;
        break;
    }

    final titleStyle =
        theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);
    final descriptionStyle =
        theme.textTheme.caption?.copyWith(fontWeight: FontWeight.w500);
    final timeStyle = theme.textTheme.subtitle2;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: task.isCompleted ? 0.5 : 1,
      child: SelectableCard(
        onTap: () =>
            GoRouter.of(context).push('/tasks/edit/${task.id}', extra: task),
        identifier: task.id,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TaskImportanceLine(
              colorByImportance: colorByImportance,
            ),
            const SizedBox(width: 8),
            Flexible(
              fit: FlexFit.tight,
              child: _TaskTextBlock(
                task: task,
                titleStyle: titleStyle,
                descriptionStyle: descriptionStyle,
                timeStyle: timeStyle,
              ),
            ),
            const SizedBox(width: 12),
            _TaskCheckbox(task: task),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

class _TaskImportanceLine extends StatelessWidget {
  const _TaskImportanceLine({
    required this.colorByImportance,
  });

  final Color colorByImportance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 7,
      child: ColoredBox(color: colorByImportance),
    );
  }
}

class _TaskTextBlock extends StatelessWidget {
  const _TaskTextBlock({
    required this.task,
    this.titleStyle,
    this.descriptionStyle,
    this.timeStyle,
  });

  final Task task;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? timeStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        _TaskTimeText(task, timeStyle: timeStyle),
        Text(
          task.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: titleStyle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 2,
          ),
          child: Text(
            task.description,
            style: descriptionStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}

class _TaskTimeText extends StatelessWidget {
  const _TaskTimeText(this.task, {this.timeStyle});

  final Task task;
  final TextStyle? timeStyle;

  @override
  Widget build(BuildContext context) {
    final timeToShow = task.completedAt ?? task.modifiedAt ?? task.createdAt;

    final formattedTime = timeToShow.localFormat();

    final ts = t.common.timeSubtitle;
    final String finalTextTime;
    if (task.isCompleted) {
      finalTextTime = ts.completedAt(time: formattedTime);
    } else if (task.modifiedAt != null) {
      finalTextTime = ts.modifiedAt(time: formattedTime);
    } else {
      finalTextTime = ts.createdAt(time: formattedTime);
    }

    return Text(
      finalTextTime,
      style: timeStyle,
    );
  }
}

class _TaskCheckbox extends StatelessWidget {
  const _TaskCheckbox({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: task.isCompleted,
        shape: const CircleBorder(),
        onChanged: (value) => context.read<TasksListBloc>()
          ..add(
            ChangeTaskCompletionEvent(
              task,
              completion: value ?? false,
            ),
          ),
      ),
    );
  }
}
