import 'package:flutter/material.dart';
import 'package:not_zero/helpers/theming.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskColors = Theme.of(context).extension<TaskColors>()!;
    Color _colorByImportance() {
      switch (task.importance) {
        case TaskImportance.notImportant:
          return taskColors.notImportantColor;
        case TaskImportance.normal:
          return taskColors.normalColor;
        case TaskImportance.important:
          return taskColors.importantColor;
      }
    }

    return SizedBox(
      height: 50,
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => print('Task $task was tapped'),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 7,
                child: ColoredBox(
                  color: _colorByImportance(),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    task.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
