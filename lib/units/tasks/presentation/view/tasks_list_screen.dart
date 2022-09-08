import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/strings.g.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/tasks_list_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_bloc.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_card.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.tasks.list.title),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<TasksListBloc>()..add(const LoadTasksEvent()),
          ),
          BlocProvider(
            create: (_) => getIt<ItemSelectionBloc>(),
          ),
        ],
        child: const _TasksListScreenBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).push('/tasks/edit'),
        child: const Icon(Icons.add_task_rounded),
      ),
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
          loaded: _TasksListView.new,
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
