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
import 'package:not_zero_app/src/features/habits/di.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HabitsListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HabitsListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionNotifier = ref.watch(itemSelectionNotifierProvider.notifier);
    final selectedItemsCount = ref.watch(
      itemSelectionNotifierProvider.select((selection) => selection.length),
    );

    final habitsUiStyle = ref.watch(habitsUiStyleNotifierProvider);
    final habitsUiStyleNotifier = ref.watch(
      habitsUiStyleNotifierProvider.notifier,
    );

    if (selectedItemsCount == 0) {
      return AppBar(
        title: Text(context.t.habits.list.title),
        actions: [
          IconButton(
            onPressed: habitsUiStyleNotifier.toggleExpandedHabitsUi,
            icon: Icon(
              habitsUiStyle == .compact
                  ? Icons.unfold_more_rounded
                  : Icons.unfold_less_rounded,
            ),
          ),
        ],
      );
    } else {
      return AppBar(
        title: Text(
          context.t.habits.list.titleSelection(n: selectedItemsCount),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final habitList = ref.read(habitsListNotifierProvider).value;
              selectionNotifier.addAll(
                habitList?.map((e) => e.id).toSet() ?? const {},
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
