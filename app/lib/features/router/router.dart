import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/features/home/presentation/home_page.dart';
import 'package:not_zero/features/planning/presentation/planning_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'plans',
            builder: (context, state) => const PlanningPage(),
          ),
        ],
      ),
    ],
  );
});
