import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/units/tasks/presentation/bloc/events/tasks_list_event.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_cubit.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_card.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: BlocProvider(
        create: (_) => getIt<TasksListCubit>()..add(const LoadTasksEvent()),
        child: const _TasksListScreenBody(),
      ),
    );
  }
}

class _TasksListScreenBody extends StatelessWidget {
  const _TasksListScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksListCubit, TasksListState>(
      builder: (context, state) {
        return state.when<Widget>(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (tasks) {
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 5,
                ),
                child: TaskCard(tasks[index]),
              ),
              itemCount: tasks.length,
            );
          },
        );
      },
    );
  }
}
