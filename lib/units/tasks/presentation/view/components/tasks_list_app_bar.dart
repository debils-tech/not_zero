import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';
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
          t.tasks.list.titleSelection(count: itemSelBloc.state.length),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final tasksState = tasksListBloc.state;
              if (tasksState is TasksLoadedState) {
                itemSelBloc.add(
                  AddAllItemsToSelectionEvent(
                    tasksState.tasks.map((e) => e.id).toSet(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.select_all),
          ),
          IconButton(
            onPressed: () {
              itemSelBloc.add(const RemoveAllItemsFromSelectionEvent(null));
            },
            icon: const Icon(Icons.close),
          ),
        ],
      );
    }
  }
}
