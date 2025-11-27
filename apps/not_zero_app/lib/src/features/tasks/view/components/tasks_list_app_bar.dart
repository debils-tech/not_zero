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
import 'package:not_zero_app/src/features/tasks/di.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TasksListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TasksListAppBar({super.key});

  @override
  Size get preferredSize => const .fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionNotifier = ref.watch(itemSelectionNotifierProvider.notifier);
    final selectedItemsCount = ref.watch(
      itemSelectionNotifierProvider.select((selection) => selection.length),
    );

    if (selectedItemsCount == 0) {
      return AppBar(
        title: Text(context.t.tasks.list.title),
        actions: const [
          _TasksSomedayButton(),
        ],
      );
    } else {
      return AppBar(
        title: Text(
          context.t.tasks.list.titleSelection(n: selectedItemsCount),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final taskList = ref.read(tasksMainListNotifier).value;
              selectionNotifier.addAll(
                taskList?.map((e) => e.id).toSet() ?? const {},
              );
            },
            tooltip: context.t.tasks.list.tooltips.selectAllButton,
            icon: const Icon(Icons.select_all_rounded),
          ),
          IconButton(
            onPressed: selectionNotifier.removeAll,
            tooltip: context.t.tasks.list.tooltips.removeSelectionButton,
            icon: const Icon(Icons.deselect_rounded),
          ),
        ],
      );
    }
  }
}

class _TasksSomedayButton extends ConsumerWidget {
  const _TasksSomedayButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(tasksFiltersNotifier.select((state) => state.someday))) {
      return FilledButton.tonalIcon(
        onPressed: () {
          ref.read(tasksFiltersNotifier.notifier).selectDay(DateTime.now());
        },
        icon: const Icon(Icons.alarm_rounded),
        label: Text(context.t.tasks.list.planning.labelWhenEnabled),
      );
    }

    return IconButton(
      onPressed: () {
        ref.read(tasksFiltersNotifier.notifier).toggleSomeday();
      },
      icon: const Icon(Icons.alarm_off_rounded),
    );
  }
}
