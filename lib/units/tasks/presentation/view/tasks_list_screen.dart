import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/confirmation_dialog.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/tasks_list_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_bloc.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_card.dart';
import 'package:not_zero/units/tasks/presentation/view/components/tasks_list_app_bar.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ItemSelectionBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<TasksListBloc>()..add(const LoadTasksEvent()),
        )
      ],
      child: const Scaffold(
        appBar: TasksListAppBar(),
        body: _TasksListScreenBody(),
        floatingActionButton: _TasksListFloatingButton(),
      ),
    );
  }
}

class _TasksListFloatingButton extends StatelessWidget {
  const _TasksListFloatingButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemSelectionBloc, Set<String>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return FloatingActionButton(
            onPressed: () => GoRouter.of(context).push('/tasks/new'),
            child: const Icon(Icons.add_task_rounded),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _TasksListScreenBody extends StatelessWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksListBloc, TasksListState>(
      builder: (context, state) {
        return state.when<Widget>(
          loading: () => const _TasksLoadingView(),
          loaded: (tasks) => BlocBuilder<ItemSelectionBloc, Set<String>>(
            builder: (context, state) {
              if (state.isEmpty) {
                return _TasksListView(tasks);
              } else {
                return Stack(
                  children: [
                    _TasksListView(tasks),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _TasksSelectionActions(tasks),
                    ),
                  ],
                );
              }
            },
          ),
        );
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
  const _TasksListView(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ImplicitlyAnimatedList<Task>(
      padding: const EdgeInsets.only(top: 5, bottom: 75, left: 5, right: 5),
      items: tasks,
      areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
      insertDuration: const Duration(milliseconds: 300),
      removeDuration: const Duration(milliseconds: 200),
      updateDuration: const Duration(milliseconds: 100),
      itemBuilder: (context, animation, item, index) => SizeFadeTransition(
        animation: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 5,
          ),
          child: TaskCard(item),
        ),
      ),
    );
  }
}

class _TasksSelectionActions extends StatelessWidget
    implements PreferredSizeWidget {
  const _TasksSelectionActions(this.tasks);

  final List<Task> tasks;

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).navigationBarTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const [
            _DeleteTasksButton(),
          ],
        ),
      ),
    );
  }
}

class _DeleteTasksButton extends StatelessWidget {
  const _DeleteTasksButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showConfirmationDialog(
        context,
        title: t.common.dialog.deleteTitle,
        content: t.tasks.list.deleteDialog.content,
        confirm: t.common.dialog.deleteButton,
        dangerous: true,
      ).then((value) {
        if (value ?? false) {
          context.read<TasksListBloc>().add(
                DeleteSelectedTasksEvent(
                  context.read<ItemSelectionBloc>().state,
                ),
              );
          context
              .read<ItemSelectionBloc>()
              .add(const RemoveAllItemsFromSelectionEvent(null));
        }
      }),
      iconSize: 28,
      tooltip: t.tasks.list.tooltips.deleteSelectedButton,
      icon: Icon(
        Icons.delete_outline,
        color: Theme.of(context).errorColor,
      ),
    );
  }
}
