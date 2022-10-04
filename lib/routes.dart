import 'package:go_router/go_router.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
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
          path: 'new',
          builder: (context, state) => const TaskEditScreen(),
        ),
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) {
            final taskId = state.params['id']!;

            assert(
              PatternValidator.isUuid(taskId),
              'Task ID must have UUID format',
            );

            return TaskEditScreen(
              taskToEdit: state.extra as Task?,
            );
          },
        ),
      ],
    ),
  ],
);
