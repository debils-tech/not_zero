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
import 'package:not_zero_app/src/features/check_in/di.dart';
import 'package:not_zero_app/src/features/check_in/models/check_in_streak_state.dart';
import 'package:not_zero_app/src/features/stats/di.dart';
import 'package:not_zero_app/src/helpers/not_zero_icons.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class HomeStatsHeader extends ConsumerWidget {
  const HomeStatsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final totalScore = ref.watch(totalScoreNotifierProvider).value;

    final checkInStreakState = ref.watch(checkInStateNotifierProvider).value;
    final currentStreakCount = switch (checkInStreakState) {
      CheckInStreakStateCheckedIn(:final checkIn) => checkIn.streakCount,
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
      child: Column(
        mainAxisAlignment: .center,
        spacing: 4,
        children: [
          Row(
            mainAxisSize: .min,
            spacing: 6,
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
              const Icon(NotZeroIcons.zero),
            ],
          ),
          if (currentStreakCount != null && currentStreakCount > 1)
            Text(
              context.t.checkIn.streakBadge.title(n: currentStreakCount),
              style: context.theme.textTheme.labelMedium?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
