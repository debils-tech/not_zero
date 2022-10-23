import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/common_widgets/universal_list_view.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/get_it.dart';
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
        final isSelection = state.isNotEmpty;
        return FloatingActionButton(
          backgroundColor:
              isSelection ? Theme.of(context).colorScheme.error : null,
          onPressed: () => GoRouter.of(context).push('/tasks/new'),
          child: Icon(
            isSelection ? Icons.delete_outline_rounded : Icons.add_task_rounded,
          ),
        );
      },
    );
  }
}

class _TasksListScreenBody extends StatelessWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context) {
    final listKey = GlobalKey();

    return BlocBuilder<TasksListBloc, TasksListState>(
      builder: (context, state) {
        return state.when<Widget>(
          loading: () => const _TasksLoadingView(),
          loaded: (tasks) => _TasksListView(tasks, listKey: listKey),
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
  const _TasksListView(this.tasks, {this.listKey});

  final List<Task> tasks;
  final GlobalKey? listKey;

  @override
  Widget build(BuildContext context) {
    return UniversalListView<Task>(
      listKey: listKey,
      items: tasks,
      itemBuilder: (_, item, __) => TaskCard(item),
    );
  }
}
