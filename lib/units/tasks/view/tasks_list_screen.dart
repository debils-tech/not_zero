import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/adaptive/list_limiter.dart';
import 'package:not_zero/components/common_widgets/universal_list_view.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/units/tasks/di.dart';
import 'package:not_zero/units/tasks/view/components/task_card.dart';
import 'package:not_zero/units/tasks/view/components/tasks_list_app_bar.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

class TasksListScreen extends ConsumerWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ref.watch(tasksSelectionBlocProvider),
        ),
      ],
      child: const Scaffold(
        appBar: TasksListAppBar(),
        body: _TasksListScreenBody(),
        floatingActionButton: _TasksListFloatingButton(),
      ),
    );
  }
}

class _TasksListFloatingButton extends ConsumerWidget {
  const _TasksListFloatingButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<ItemSelectionBloc, Set<String>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.error,
            onPressed: () async {
              final selectionBloc = context.read<ItemSelectionBloc>();

              final confirm = await showConfirmationDialog(
                context,
                title: t.common.dialog.deleteTitle,
                content: t.tasks.list.deleteDialog
                    .content(n: selectionBloc.state.length),
                confirm: t.common.dialog.deleteButton,
                dangerous: true,
              );
              if (confirm ?? false) {
                unawaited(
                  ref.read(tasksRepositoryProvider).deleteMultipleTasks(state),
                );
                selectionBloc.add(const ItemSelectionEvent.removeAll(null));
              }
            },
            tooltip: t.tasks.list.tooltips.deleteSelectedButton,
            child: const Icon(Icons.delete_outline_rounded),
          );
        }
        return FloatingActionButton(
          onPressed: () => context.push('/tasks/new'),
          tooltip: t.tasks.list.tooltips.addNewButton,
          child: const Icon(Icons.add_task_rounded),
        );
      },
    );
  }
}

class _TasksListScreenBody extends ConsumerWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listKey = GlobalKey();

    final state = ref.watch(tasksListStreamProvider);

    return WillPopScope(
      onWillPop: () {
        final selectionBloc = context.read<ItemSelectionBloc>();
        if (selectionBloc.state.isEmpty) {
          return Future.value(true);
        }

        selectionBloc.add(const ItemSelectionEvent.removeAll(null));
        return Future.value(false);
      },
      child: switch (state) {
        AsyncData(value: final tasks) =>
          _TasksListView(tasks, listKey: listKey),
        _ => const _TasksLoadingView(),
      },
    );
  }
}

class _TasksLoadingView extends StatelessWidget {
  const _TasksLoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _TasksListView extends StatelessWidget {
  const _TasksListView(this.tasks, {this.listKey});

  final List<Task> tasks;
  final GlobalKey? listKey;

  @override
  Widget build(BuildContext context) {
    return AdaptiveListLimiter(
      maxWidth: 600,
      child: UniversalListView<Task>(
        listKey: listKey,
        items: tasks,
        itemBuilder: (_, item, __) => TaskCard(
          item,
          key: Key('Task ${item.id}'),
        ),
      ),
    );
  }
}
