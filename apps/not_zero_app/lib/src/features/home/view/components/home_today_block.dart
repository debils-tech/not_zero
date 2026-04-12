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
import 'package:not_zero_app/src/features/common/view/components/adaptive/list_limiter.dart';
import 'package:not_zero_app/src/features/home/di.dart';
import 'package:not_zero_app/src/features/home/notifiers/home_today_habits_notifier.dart';
import 'package:not_zero_app/src/features/home/view/components/home_compact_habit_card.dart';
import 'package:not_zero_app/src/features/home/view/components/home_compact_task_card.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';
import 'package:nz_base_models/nz_base_models.dart';

class HomeTodayBlock extends ConsumerWidget {
  const HomeTodayBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks =
        ref.watch(homeTodayTasksNotifierProvider).value ?? const <Task>[];
    final habits =
        ref.watch(homeTodayHabitsNotifierProvider).value ??
        const <HomePendingHabit>[];

    final entries = <_HomeTodayEntry>[
      ...tasks.map(_HomeTodayTaskEntry.new),
      ...habits.map(_HomeTodayHabitEntry.new),
    ];
    entries.sort((a, b) {
      final importance = b.importance.index.compareTo(a.importance.index);
      if (importance != 0) return importance;
      return a.typeOrder.compareTo(b.typeOrder);
    });
    final topEntries = entries.take(3).toList();
    if (topEntries.isEmpty) return const SizedBox.shrink();

    return AdaptiveListLimiter(
      child: Padding(
        padding: const .all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  context.t.common.timeOptions.today,
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                if (tasks.isNotEmpty)
                  TextButton(
                    onPressed: () => context.push('/tasks'),
                    child: Text(context.t.tasks.list.title),
                  ),
                if (habits.isNotEmpty)
                  TextButton(
                    onPressed: () => context.push('/habits'),
                    child: Text(context.t.habits.list.title),
                  ),
              ],
            ),
            ...topEntries.map((entry) {
              return Padding(
                padding: const .only(bottom: 6),
                child: switch (entry) {
                  _HomeTodayTaskEntry(:final task) => HomeCompactTaskCard(
                    task: task,
                  ),
                  _HomeTodayHabitEntry(:final habitData) =>
                    HomeCompactHabitCard(habitData: habitData),
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

sealed class _HomeTodayEntry {
  const _HomeTodayEntry();

  TaskImportance get importance;

  int get typeOrder;
}

class _HomeTodayTaskEntry extends _HomeTodayEntry {
  const _HomeTodayTaskEntry(this.task);

  final Task task;

  @override
  TaskImportance get importance => task.importance;

  @override
  int get typeOrder => 0;
}

class _HomeTodayHabitEntry extends _HomeTodayEntry {
  const _HomeTodayHabitEntry(this.habitData);

  final HomePendingHabit habitData;

  @override
  TaskImportance get importance => habitData.habit.importance;

  @override
  int get typeOrder => 1;
}
