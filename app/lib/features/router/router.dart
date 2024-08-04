import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/features/home/presentation/home_page.dart';
import 'package:not_zero/features/planning/presentation/plan_edit_bottom_sheet.dart';
import 'package:not_zero/features/planning/presentation/plan_view_bottom_sheet.dart';
import 'package:not_zero/features/planning/presentation/planning_page.dart';
import 'package:not_zero/features/router/modal_bottom_sheet_page.dart';
import 'package:not_zero/features/settings/presentation/settings_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'plans',
            builder: (context, state) => const PlanningPage(),
            routes: [
              GoRoute(
                path: 'view/:id',
                pageBuilder: (context, state) {
                  final planId = state.pathParameters['id']!;
                  return ModalBottomSheetPage(
                    child: PlanViewBottomSheet(planId: planId),
                  );
                },
              ),
              GoRoute(
                path: 'add',
                pageBuilder: (context, state) {
                  return const ModalBottomSheetPage(
                    child: PlanEditBottomSheet(),
                  );
                },
              ),
              GoRoute(
                path: 'edit/:id',
                pageBuilder: (context, state) {
                  final planId = state.pathParameters['id'];
                  return ModalBottomSheetPage(
                    child: PlanEditBottomSheet(planId: planId),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
});
