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
import 'package:nz_flutter_core/nz_flutter_core.dart';

class CheckInStreakContinuesDialog extends ConsumerWidget {
  const CheckInStreakContinuesDialog({required this.state, super.key});

  final CheckInStreakStateContinued state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckInStreakContinuedDialogContent(
      streakCount: state.lastCheckIn.streakCount + 1,
      onCheckIn: () =>
          ref.read(checkInStateNotifierProvider.notifier).checkIn(),
    );
  }
}

@visibleForTesting
class CheckInStreakContinuedDialogContent extends StatelessWidget {
  const CheckInStreakContinuedDialogContent({
    required this.streakCount,
    required this.onCheckIn,
    super.key,
  });

  final int streakCount;
  final VoidCallback onCheckIn;

  @override
  Widget build(BuildContext context) {
    final streakColor = context.theme.colorScheme.primary;
    return Column(
      children: [
        Text(
          context.t.checkIn.streakDialog.continues.title,
          style: context.theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          context.t.checkIn.streakDialog.continues.subtitle(n: streakCount),
          style: context.theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 2),
        const Divider(),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: .center,
          spacing: 4,
          children: [
            Text(
              streakCount.toString(),
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontSize: 32,
                fontWeight: .w800,
                color: streakColor,
              ),
            ),
            Icon(
              Icons.local_fire_department_rounded,
              size: 32,
              color: streakColor,
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: onCheckIn,
          icon: const Icon(Icons.check_rounded),
          label: Text(context.t.checkIn.streakDialog.continues.button),
        ),
      ],
    );
  }
}
