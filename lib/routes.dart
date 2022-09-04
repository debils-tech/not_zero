import 'package:go_router/go_router.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/view/task_edit_screen.dart';
import 'package:not_zero/units/tasks/presentation/view/tasks_list_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/tasks',
  routes: [
    GoRoute(
      path: '/tasks',
      builder: (context, state) => const TasksListScreen(),
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) => TaskEditScreen(
            taskToEdit: state.extra as Task?,
          ),
        ),
      ],
    ),
  ],
);
