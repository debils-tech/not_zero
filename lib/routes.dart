import 'package:go_router/go_router.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
import 'package:not_zero/units/home/presentation/view/home_screen.dart';
import 'package:not_zero/units/notes/presentation/view/note_edit_screen.dart';
import 'package:not_zero/units/notes/presentation/view/notes_list_screen.dart';
import 'package:not_zero/units/settings/presentation/view/about_screen.dart';
import 'package:not_zero/units/settings/presentation/view/licenses_screen.dart';
import 'package:not_zero/units/settings/presentation/view/settings_screen.dart';
import 'package:not_zero/units/settings/presentation/view/theme_settings_screen.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';
import 'package:not_zero/units/tasks/domain/repositories/tasks_repository.dart';
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
                assert(
                  state.params.containsKey('id'),
                  'This route has to pass "id" parameter',
                );

                final taskId = state.params['id']!;

                assert(
                  PatternValidator.isUuid(taskId),
                  'Task ID must have UUID format',
                );

                var taskObject = state.extra as Task?;

                if (taskObject == null) {
                  final tasksRepo = getIt<TasksRepository>();
                  taskObject = tasksRepo.getTaskById(taskId);
                }

                return TaskEditScreen(
                  taskToEdit: taskObject,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'notes',
          builder: (_, __) => const NotesListScreen(),
          routes: [
            GoRoute(
              path: 'new',
              builder: (_, __) => const NoteEditScreen(),
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
