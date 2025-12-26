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
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/common/view/components/adaptive/list_limiter.dart';
import 'package:not_zero_app/src/features/common/view/components/common_widgets/clickable_card.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';

class HomeNavigationBlock extends StatelessWidget {
  const HomeNavigationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveListLimiter(
      child: Padding(
        padding: const .all(8),
        child: Column(
          children: [
            _NavigationCard(
              route: '/tasks',
              icon: Icons.format_list_bulleted_rounded,
              title: context.t.tasks.list.title,
            ),
            const SizedBox(height: 6),
            _NavigationCard(
              route: '/habits',
              icon: Icons.published_with_changes_rounded,
              title: context.t.habits.list.title,
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
  });

  final String route;
  final IconData icon;
  final String title;

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
                Text(
                  title,
                  style: context.theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
