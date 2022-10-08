import 'package:go_router/go_router.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
import 'package:not_zero/units/home/presentation/view/home_screen.dart';
import 'package:not_zero/units/settings/presentation/view/settings_screen.dart';
import 'package:not_zero/units/settings/presentation/view/theme_settings_screen.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/presentation/view/task_edit_screen.dart';
import 'package:not_zero/units/tasks/presentation/view/tasks_list_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'tasks',
          builder: (_, __) => const TasksListScreen(),
          routes: [
            GoRoute(
              path: 'new',
              builder: (_, __) => const TaskEditScreen(),
            ),
            GoRoute(
              path: 'edit/:id',
              builder: (_, state) {
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
        GoRoute(
          path: 'settings',
          builder: (_, __) => const SettingsScreen(),
          routes: [
            GoRoute(
              path: 'theme',
              builder: (_, __) => const ThemeSettingsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
