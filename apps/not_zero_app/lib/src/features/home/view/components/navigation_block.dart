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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/common/view/components/adaptive/list_limiter.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/clickable_card.dart';
import 'package:not_zero_app/src/features/home/di.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';

class HomeNavigationBlock extends ConsumerWidget {
  const HomeNavigationBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksCount = ref.watch(
      homeTodayTasksNotifierProvider.select(
        (state) => state.value?.length ?? 0,
      ),
    );
    final habitsCount = ref.watch(
      homeTodayHabitsNotifierProvider.select(
        (state) => state.value?.length ?? 0,
      ),
    );

    return AdaptiveListLimiter(
      child: Padding(
        padding: const .all(8),
        child: Column(
          children: [
            _NavigationCard(
              route: '/tasks',
              icon: Icons.format_list_bulleted_rounded,
              title: context.t.tasks.list.title,
              badgeCount: tasksCount,
            ),
            const SizedBox(height: 6),
            _NavigationCard(
              route: '/habits',
              icon: Icons.published_with_changes_rounded,
              title: context.t.habits.list.title,
              badgeCount: habitsCount,
            ),
            const SizedBox(height: 6),
            _NavigationCard(
              route: '/stats',
              icon: Icons.bar_chart_rounded,
              title: context.t.stats.quickView.title,
            ),
            const SizedBox(height: 6),
            _NavigationCard(
              route: '/settings',
              icon: Icons.settings_rounded,
              title: context.t.settings.list.title,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationCard extends StatelessWidget {
  const _NavigationCard({
    required this.route,
    required this.icon,
    required this.title,
    this.badgeCount = 0,
  });

  final String route;
  final IconData icon;
  final String title;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ClickableCard(
        child: InkWell(
          onTap: () => context.push(route),
          child: Padding(
            padding: const .symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: context.theme.textTheme.titleLarge,
                  ),
                ),
                if (badgeCount > 0) _NavigationBadge(count: badgeCount),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationBadge extends StatelessWidget {
  const _NavigationBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 8, vertical: 2),
        child: Text(
          count.toString(),
          style: context.theme.textTheme.labelMedium?.copyWith(
            color: context.theme.colorScheme.onError,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
