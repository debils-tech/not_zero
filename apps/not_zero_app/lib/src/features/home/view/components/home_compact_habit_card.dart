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
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/clickable_card.dart';
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:not_zero_app/src/features/home/notifiers/home_today_habits_notifier.dart';
import 'package:not_zero_app/src/features/themes/extensions/tasks_colors.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HomeCompactHabitCard extends ConsumerWidget {
  const HomeCompactHabitCard({
    required this.habitData,
    super.key,
  });

  final HomePendingHabit habitData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = habitData.habit;

    return SizedBox(
      height: 62,
      child: ClickableCard(
        child: InkWell(
          onTap: () {
            unawaited(HapticFeedback.mediumImpact());
            final completion = switch (habitData.todayCompletion) {
              null => HabitCompletion.create(
                habitId: habit.id,
                completedDate: DateTime.now(),
              ),
              final existing => existing.copyWith(
                type: HabitCompletionType.completed,
              ),
            };
            unawaited(
              ref.read(habitsRepositoryProvider).addHabitCompletion(
                    habit: habit,
                    completion: completion,
                  ),
            );
          },
          onLongPress: () => context.push('/habits/view/${habit.id}', extra: habit),
          child: _ImportanceIndicatorBox(
            importance: habit.importance,
            child: Padding(
              padding: const .symmetric(horizontal: 12),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Text(
                      habit.title,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        color: context.theme.colorScheme.primary,
                        size: 16,
                      ),
                      Text(
                        habitData.streak.toString(),
                        style: context.theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.check_circle_outline_rounded, size: 22),
                ],
              ),
            ),
          ),
        ),
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
            color: _colorByImportance(importance, context.theme.tasksColorScheme),
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
