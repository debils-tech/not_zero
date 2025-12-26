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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/themes/themes.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

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
  Size get preferredSize => const .fromHeight(8);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: .expand(height: preferredSize.height),
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
  ) => switch (importance) {
    .notImportant => colorScheme.notImportantColor,
    .normal => colorScheme.normalColor,
    .important => colorScheme.importantColor,
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
      padding: const .only(top: 7, bottom: 75, left: 7, right: 7),
      children: [
        GestureDetector(
          onTap: () => context.pushReplacement(
            '/habits/edit/${habitToView.id}',
            extra: habitToView,
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              const SizedBox(height: 8),
              Text(
                habit.title,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: .w700,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        if (habit.description.isNotEmpty)
          Padding(
            padding: const .symmetric(horizontal: 8),
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
