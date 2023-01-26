import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/adaptive/list_limiter.dart';
import 'package:not_zero/components/common_widgets/clickable_card.dart';
import 'package:not_zero/i18n/translations.g.dart';

class HomeNavigationBlock extends StatelessWidget {
  const HomeNavigationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveListLimiter(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _NavigationCard(
              route: '/tasks',
              icon: Icons.format_list_bulleted,
              title: t.tasks.list.title,
            ),
            const SizedBox(height: 6),
            _NavigationCard(
              route: '/settings',
              icon: Icons.settings,
              title: t.settings.list.title,
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
          onTap: () => GoRouter.of(context).push(route),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 25,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
