import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nz_base_models/nz_base_models.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitViewScreen extends ConsumerWidget {
  const HabitViewScreen({required this.habitToView, super.key});

  final Habit habitToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.habits.view.title),
        bottom: _HabitViewImportanceIndicator(habitToView),
      ),
      body: _HabitViewScreenBody(habitToView),
      floatingActionButton: _EditFloatingButton(habitToView),
    );
  }
}

class _HabitViewImportanceIndicator extends StatelessWidget
    implements PreferredSizeWidget {
  const _HabitViewImportanceIndicator(this.habit);

  final Habit habit;

  @override
  Size get preferredSize => const Size.fromHeight(8);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: preferredSize.height),
      child: ColoredBox(
        color: _colorByImportance(
          habit.importance,
          context.theme.tasksColorScheme,
        ),
      ),
    );
  }

  Color _colorByImportance(
    TaskImportance importance,
    TasksColorScheme colorScheme,
  ) =>
      switch (importance) {
        TaskImportance.notImportant => colorScheme.notImportantColor,
        TaskImportance.normal => colorScheme.normalColor,
        TaskImportance.important => colorScheme.importantColor,
      };
}

class _HabitViewScreenBody extends ConsumerWidget {
  const _HabitViewScreenBody(this.habitToView);

  final Habit habitToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(uSlashVlad): Add a stream to watch for habit changes
    final habit = habitToView;

    return ListView(
      padding: const EdgeInsets.only(top: 7, bottom: 75, left: 7, right: 7),
      children: [
        GestureDetector(
          onTap: () => context.pushReplacement(
            '/habits/edit/${habitToView.id}',
            extra: habitToView,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Text(
                habit.title,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        if (habit.description.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SelectableText(habit.description),
          ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _EditFloatingButton extends ConsumerWidget {
  const _EditFloatingButton(this.habitToView);

  final Habit habitToView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => context.pushReplacement(
        '/habits/edit/${habitToView.id}',
        extra: habitToView,
      ),
      tooltip: context.t.habits.view.tooltips.editHabitButton,
      child: const Icon(Icons.edit_rounded),
    );
  }
}
