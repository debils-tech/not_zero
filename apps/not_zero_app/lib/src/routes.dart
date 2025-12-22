// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/habits/view/habit_edit_screen.dart';
import 'package:not_zero_app/src/features/habits/view/habit_view_screen.dart';
import 'package:not_zero_app/src/features/habits/view/habits_list_screen.dart';
import 'package:not_zero_app/src/features/home/view/home_screen.dart';
import 'package:not_zero_app/src/features/settings/view/about_screen.dart';
import 'package:not_zero_app/src/features/settings/view/debug_screen.dart';
import 'package:not_zero_app/src/features/settings/view/licenses_screen.dart';
import 'package:not_zero_app/src/features/settings/view/settings_screen.dart';
import 'package:not_zero_app/src/features/settings/view/storage_screen.dart';
import 'package:not_zero_app/src/features/settings/view/theme_settings_screen.dart';
import 'package:not_zero_app/src/features/stats/view/quick_statistics_screen.dart';
import 'package:not_zero_app/src/features/tasks/view/task_edit_screen.dart';
import 'package:not_zero_app/src/features/tasks/view/task_view_screen.dart';
import 'package:not_zero_app/src/features/tasks/view/tasks_list_screen.dart';
import 'package:not_zero_app/src/helpers/global_navigation.dart';
import 'package:nz_base_models/nz_base_models.dart';

final appRouterProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    navigatorKey: GlobalNavigation.key,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'tasks',
            builder: (_, _) => const TasksListScreen(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (_, _) => const TaskEditScreen(),
              ),
              GoRoute(
                path: 'view/:id',
                builder: (context, state) {
                  final extra = state.extra;
                  assert(extra is Task, 'Extra should be Task object');
                  return TaskViewScreen(
                    // TODO(uSlashVlad): Maybe will be helpful to load actual task
                    taskToView: extra! as Task,
                  );
                },
              ),
              GoRoute(
                path: 'edit/:id',
                builder: (context, state) {
                  final extra = state.extra;
                  assert(extra is Task, 'Extra should be Task object');
                  return TaskEditScreen(
                    taskToEdit: extra as Task?,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: 'habits',
            builder: (_, _) => const HabitsListScreen(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (_, _) => const HabitEditScreen(),
              ),
              GoRoute(
                path: 'view/:id',
                builder: (context, state) {
                  final extra = state.extra;
                  assert(extra is Habit, 'Extra should be Habit object');
                  return HabitViewScreen(
                    habitToView: extra! as Habit,
                  );
                },
              ),
              GoRoute(
                path: 'edit/:id',
                builder: (context, state) {
                  final extra = state.extra;
                  assert(extra is Habit, 'Extra should be Habit object');
                  return HabitEditScreen(
                    habitToEdit: extra as Habit?,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: 'stats',
            builder: (_, _) => const QuickStatisticsScreen(),
          ),
          GoRoute(
            path: 'settings',
            builder: (_, _) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'theme',
                builder: (_, _) => const ThemeSettingsScreen(),
              ),
              GoRoute(
                path: 'storage',
                builder: (_, _) => const StorageSettingsScreen(),
              ),
              GoRoute(
                path: 'debug',
                builder: (_, _) => const DebugScreen(),
              ),
              GoRoute(
                path: 'about',
                builder: (_, _) => const AboutScreen(),
                routes: [
                  GoRoute(
                    path: 'licenses',
                    builder: (_, _) => const LicensesScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
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
