// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2026 Nagorny Vladislav
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
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/models/week_start.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';

class WeekStartSettingsScreen extends ConsumerWidget {
  const WeekStartSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effectiveValue = ref.watch(effectiveWeekStartProvider);
    final controller = ref.watch(weekStartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.settings.weekStart.title),
      ),
      body: RadioGroup<WeekStart>(
        groupValue: effectiveValue,
        onChanged: (value) {
          if (value == null || value == effectiveValue) return;
          controller.setWeekStart(value);
        },
        child: ListView(
          children: [
            ListTile(
              title: Text(context.t.settings.weekStart.subtitle),
            ),
            RadioListTile<WeekStart>(
              title: Text(context.t.settings.weekStart.values.monday),
              value: WeekStart.monday,
            ),
            RadioListTile<WeekStart>(
              title: Text(context.t.settings.weekStart.values.sunday),
              value: WeekStart.sunday,
            ),
            RadioListTile<WeekStart>(
              title: Text(context.t.settings.weekStart.values.saturday),
              value: WeekStart.saturday,
            ),
          ],
        ),
      ),
    );
  }
}
