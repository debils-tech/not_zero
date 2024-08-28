import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/units/tasks/di.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class TasksListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TasksListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemSelBloc = context.watch<ItemSelectionBloc>();

    if (itemSelBloc.state.isEmpty) {
      return AppBar(
        title: Text(t.tasks.list.title),
      );
    } else {
      return AppBar(
        title: Text(
          t.tasks.list.titleSelection(n: itemSelBloc.state.length),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final taskList = ref.read(tasksListStreamProvider).value;
              itemSelBloc.add(
                ItemSelectionEvent.addAll(
                  taskList?.map((e) => e.id).toSet() ?? const {},
                ),
              );
            },
            tooltip: t.tasks.list.tooltips.selectAllButton,
            icon: const Icon(Icons.select_all_rounded),
          ),
          IconButton(
            onPressed: () {
              itemSelBloc.add(const ItemSelectionEvent.removeAll(null));
            },
            tooltip: t.tasks.list.tooltips.removeSelectionButton,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      );
    }
  }
}
