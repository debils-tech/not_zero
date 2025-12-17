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
