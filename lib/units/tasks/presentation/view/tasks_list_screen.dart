import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/units/tasks/presentation/bloc/states/tasks_list_state.dart';
import 'package:not_zero/units/tasks/presentation/bloc/tasks_list_cubit.dart';
import 'package:not_zero/units/tasks/presentation/view/components/task_card.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: BlocProvider(
        create: (_) => TasksListCubit()..loadTasks(),
        child: const _TasksListScreenBody(),
      ),
    );
  }
}

class _TasksListScreenBody extends StatelessWidget {
  const _TasksListScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksListCubit, TasksListState>(
      builder: ((context, state) {
        return state.when(
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (tasks) {
            return ListView.builder(
              shrinkWrap: true,
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
      }),
    );
  }
}
