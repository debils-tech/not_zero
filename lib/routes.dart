import 'package:go_router/go_router.dart';
import 'package:not_zero/helpers/global_navigation.dart';
import 'package:not_zero/units/home/view/home_screen.dart';
import 'package:not_zero/units/settings/view/about_screen.dart';
import 'package:not_zero/units/settings/view/licenses_screen.dart';
import 'package:not_zero/units/settings/view/settings_screen.dart';
import 'package:not_zero/units/settings/view/storage_screen.dart';
import 'package:not_zero/units/settings/view/theme_settings_screen.dart';
import 'package:not_zero/units/stats/view/quick_statistics_screen.dart';
import 'package:not_zero/units/tasks/view/task_edit_screen.dart';
import 'package:not_zero/units/tasks/view/task_view_screen.dart';
import 'package:not_zero/units/tasks/view/tasks_list_screen.dart';
import 'package:nz_tasks_models/nz_tasks_models.dart';

final appRouter = GoRouter(
  navigatorKey: GlobalNavigation.key,
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
              path: 'view/:id',
              builder: (context, state) {
                final extra = state.extra;
                assert(extra is Task?, 'Extra should be Task object');
                final taskObject = extra! as Task;

                // final taskId = state.pathParameters['id'];
                // if (taskObject == null && taskId != null) {
                //   taskObject = _getTaskById(taskId);
                // }
                //
                // if (taskObject == null) {
                //   _redirectToNewTask(context);
                //   return const CommonLoadingScreen();
                // }
                // TODO(uSlashVlad): Return logic about getting tasks by id

                return TaskViewScreen(
                  taskToView: taskObject,
                );
              },
            ),
            GoRoute(
              path: 'edit/:id',
              builder: (context, state) {
                final extra = state.extra;
                assert(extra is Task?, 'Extra should be Task object');
                final taskObject = extra! as Task;

                // final taskId = state.pathParameters['id'];
                // if (taskObject == null && taskId != null) {
                //   taskObject = _getTaskById(taskId);
                // }
                //
                // if (taskObject == null) {
                //   _redirectToNewTask(context);
                //   return const CommonLoadingScreen();
                // }
                // TODO(uSlashVlad): Return logic about getting tasks by id

                return TaskEditScreen(
                  taskToEdit: taskObject,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'stats',
          builder: (_, __) => const QuickStatisticsScreen(),
        ),
        GoRoute(
          path: 'settings',
          builder: (_, __) => const SettingsScreen(),
          routes: [
            GoRoute(
              path: 'theme',
              builder: (_, __) => const ThemeSettingsScreen(),
            ),
            GoRoute(
              path: 'storage',
              builder: (_, __) => const StorageSettingsScreen(),
            ),
            GoRoute(
              path: 'about',
              builder: (_, __) => const AboutScreen(),
              routes: [
                GoRoute(
                  path: 'licenses',
                  builder: (_, __) => const LicensesScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Function for getting task from `TasksRepository` using ID.
///
/// Usually needed in deep linking cases.
// Task? _getTaskById(String taskId) {
//   if (!PatternValidator.isUuid(taskId)) return null;
//
//   return getIt<TasksRepository>().getTaskById(taskId);
// }

/// Function for redirecting to the "New Task" screen.
///
/// Usually needed when no task found in router callback.
// void _redirectToNewTask(BuildContext context) {
//   context.pushReplacement('/tasks/new');
// }
