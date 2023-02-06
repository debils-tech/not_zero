import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_bloc.dart';

class TasksListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TasksListAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final itemSelBloc = context.watch<ItemSelectionBloc>();
    final tasksListBloc = context.watch<TasksListBloc>();

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
              tasksListBloc.state.mapOrNull(
                loaded: (tasksState) {
                  itemSelBloc.add(
                    ItemSelectionEvent.addAll(
                      tasksState.tasks.map((e) => e.id).toSet(),
                    ),
                  );
                },
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
