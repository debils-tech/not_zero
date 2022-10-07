import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero/components/common_widgets/clickable_card.dart';
import 'package:not_zero/i18n/strings.g.dart';

class HomeNavigationBlock extends StatelessWidget {
  const HomeNavigationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 100,
        child: ClickableCard(
          child: InkWell(
            onTap: () => GoRouter.of(context).push('/tasks'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.format_list_bulleted,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    t.tasks.list.title,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}