import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitCard extends StatelessWidget {
  const HabitCard(
    this.habit, {
    super.key,
  });

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return SelectableCard(
      onTap: () => context.push('/habits/view/${habit.id}', extra: habit),
      identifier: habit.id,
      child: _ImportanceIndicatorBox(
        importance: habit.importance,
        child: Row(
          children: [
            const SizedBox(width: 15),
            Flexible(
              fit: FlexFit.tight,
              child: _HabitTextBlock(habit: habit),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class _HabitTextBlock extends StatelessWidget {
  const _HabitTextBlock({required this.habit});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          habit.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        if (habit.description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: Text(
              habit.description,
              style: context.theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        const SizedBox(height: 8),
      ],
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
    TaskImportance.notImportant => colorScheme.notImportantColor,
    TaskImportance.normal => colorScheme.normalColor,
    TaskImportance.important => colorScheme.importantColor,
  };
}
