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
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/build_context_quick_access_ext.dart';

class CheckInStreakContinuedDialog extends StatelessWidget {
  const CheckInStreakContinuedDialog({
    required this.streakCount,
    required this.onCheckIn,
    super.key,
  });

  final int streakCount;
  final VoidCallback onCheckIn;

  @override
  Widget build(BuildContext context) {
    final streakColor = context.theme.colorScheme.primary;
    return Dialog(
      child: Padding(
        padding: const .symmetric(vertical: 16),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              context.t.checkIn.streakDialog.continues.title,
              style: context.theme.textTheme.titleLarge,
            ),
            Padding(
              padding: const .only(top: 8, bottom: 2, left: 8, right: 8),
              child: Text(
                context.t.checkIn.streakDialog.continues.subtitle(
                  n: streakCount,
                ),
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
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
        ),
      ),
    );
  }
}
