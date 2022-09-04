import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

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
      height: 70,
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => GoRouter.of(context).push('/tasks/edit', extra: task),
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TaskTimeText(task: task),
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskTimeText extends StatelessWidget {
  const _TaskTimeText({
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final timeToShow = task.modifiedAt ?? task.createdAt;

    final String dateTimeText;
    if (timeToShow.day == DateTime.now().day) {
      dateTimeText = DateFormat.Hms().format(timeToShow);
    } else {
      dateTimeText = DateFormat.yMMMd().format(timeToShow);
    }

    return Text(
      task.modifiedAt == null
          ? t.tasks.list.timeSubtitle.createdAt(time: dateTimeText)
          : t.tasks.list.timeSubtitle.modifiedAt(time: dateTimeText),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }
}
