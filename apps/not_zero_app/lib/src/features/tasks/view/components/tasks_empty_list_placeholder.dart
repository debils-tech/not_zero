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
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';

class TasksEmptyListPlaceholder extends ConsumerWidget {
  const TasksEmptyListPlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFilters = ref.watch(
      tasksFiltersNotifier.select(
        (state) => (state.canceled ?? false) || state.searchTags.isNotEmpty,
      ),
    );

    final somedayTaskCount = ref.watch(_somedayTaskCountProvider).value;

    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: .center,
      children: [
        const SizedBox(height: 24),
        Text(
          context.t.tasks.list.empty.icon,
          style: theme.textTheme.displayLarge?.copyWith(fontSize: 48),
        ),
        const SizedBox(height: 16),
        Text(
          hasFilters
              ? context.t.tasks.list.empty.titleFilters
              : context.t.tasks.list.empty.title,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        if (somedayTaskCount != null && somedayTaskCount > 0) ...[
          OutlinedButton.icon(
            onPressed: () =>
                ref.read(tasksFiltersNotifier.notifier).toggleSomeday(),
            label: Text(context.t.tasks.list.empty.buttonPlanning),
            icon: const Icon(Icons.arrow_forward_rounded),
          ),
          const SizedBox(height: 4),
        ],
        if (hasFilters)
          TextButton(
            onPressed: () =>
                ref.read(tasksFiltersNotifier.notifier).resetFilters(),
            child: Text(context.t.tasks.list.empty.buttonFilters),
          )
        else
          TextButton(
            onPressed: () => context.go('/tasks/new'),
            child: Text(context.t.tasks.list.empty.button),
          ),
        const SizedBox(height: 24),
      ],
    );
  }
}

final _somedayTaskCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final currentFilters = ref.watch(tasksFiltersNotifier);
  if (currentFilters.someday) return 0;

  final newFilters = currentFilters.copyWith(someday: true);
  final tasks = await ref.watch(tasksRepositoryProvider).getTasks(newFilters);
  return tasks.length;
});
