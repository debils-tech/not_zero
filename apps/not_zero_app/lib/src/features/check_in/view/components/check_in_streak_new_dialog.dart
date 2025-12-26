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

class CheckInStreakNewDialog extends StatelessWidget {
  const CheckInStreakNewDialog({
    required this.onCheckIn,
    super.key,
  });

  final VoidCallback onCheckIn;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const .symmetric(vertical: 16),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              context.t.checkIn.streakDialog.newStreak.title,
              style: context.theme.textTheme.titleLarge,
            ),
            Padding(
              padding: const .only(top: 8, bottom: 2, left: 8, right: 8),
              child: Text(
                context.t.checkIn.streakDialog.newStreak.subtitle,
                style: context.theme.textTheme.bodySmall?.copyWith(
                  color: context.theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onCheckIn,
              icon: const Icon(Icons.check_rounded),
              label: Text(context.t.checkIn.streakDialog.newStreak.button),
            ),
          ],
        ),
      ),
    );
  }
}
