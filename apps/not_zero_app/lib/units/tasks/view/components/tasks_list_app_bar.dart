import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/units/tasks/di.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TasksListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TasksListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionNotifier = ref.watch(itemSelectionNotifierProvider.notifier);
    final selectedItemsCount = ref.watch(
      itemSelectionNotifierProvider.select((selection) => selection.length),
    );

    if (selectedItemsCount == 0) {
      return AppBar(
        title: Text(t.tasks.list.title),
      );
    } else {
      return AppBar(
        title: Text(
          t.tasks.list.titleSelection(n: selectedItemsCount),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final taskList = ref.read(tasksListStreamProvider).value;
              selectionNotifier.addAll(
                taskList?.map((e) => e.id).toSet() ?? const {},
              );
            },
            tooltip: t.tasks.list.tooltips.selectAllButton,
            icon: const Icon(Icons.select_all_rounded),
          ),
          IconButton(
            onPressed: selectionNotifier.removeAll,
            tooltip: t.tasks.list.tooltips.removeSelectionButton,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      );
    }
  }
}
