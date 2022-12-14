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

    return SizedBox(
      height: 79,
      child: Opacity(
        opacity: task.isCompleted ? 0.5 : 1,
        child: SelectableCard(
          onTap: () =>
              GoRouter.of(context).push('/tasks/edit/${task.id}', extra: task),
          identifier: task.id,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 7,
                child: ColoredBox(
                  color: colorByImportance,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TaskTimeText(task),
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      child: Text(
                        task.description,
                        style: theme.textTheme.caption!
                            .copyWith(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Transform.scale(
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
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskTimeText extends StatelessWidget {
  const _TaskTimeText(this.task);

  final Task task;

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
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
