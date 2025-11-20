import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/helpers/not_zero_icons.dart';

class HomeStatsHeader extends ConsumerWidget {
  const HomeStatsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final state = ref.watch(totalScoreNotifierProvider);
    final totalScore = switch (state) {
      AsyncData(:final value) => value,
      _ => null,
    };

    return Container(
      height: 150,
      alignment: .center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: .bottomCenter,
          end: .topCenter,
          colors: [
            theme.scaffoldBackgroundColor,
            theme.colorScheme.primaryContainer,
            theme.colorScheme.primary,
          ],
          stops: const [0.0, 0.3, 1.0],
        ),
      ),
      padding: const .only(bottom: 15),
      child: Row(
        mainAxisSize: .min,
        children: [
          if (totalScore != null)
            Text(
              totalScore.toString(),
              style: const TextStyle(
                fontSize: 34,
                fontWeight: .w700,
              ),
            )
          else
            const CircularProgressIndicator(),
          const SizedBox(width: 6),
          const Icon(NotZeroIcons.zero),
        ],
      ),
    );
  }
}
