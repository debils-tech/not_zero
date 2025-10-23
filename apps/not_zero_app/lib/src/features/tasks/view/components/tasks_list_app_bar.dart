import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tasks/di.dart';
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
        title: Text(context.t.tasks.list.title),
        actions: const [
          _TasksSomedayButton(),
          _TasksPopupMenuButton(),
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

class _TasksPopupMenuButton extends ConsumerWidget {
  const _TasksPopupMenuButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showCanceled = ref.watch(
      // null means show all
      tasksFiltersNotifier.select((state) => state.canceled == null),
    );

    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem<void>(
          onTap: () {
            if (showCanceled) {
              ref.read(tasksFiltersNotifier.notifier).hideCanceled();
            } else {
              ref.read(tasksFiltersNotifier.notifier).showCanceled();
            }
          },
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.t.tasks.list.appBarActions.popupMenu.showCanceledOption,
                ),
              ),
              Visibility(
                visible: showCanceled,
                child: const Icon(Icons.check_rounded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
