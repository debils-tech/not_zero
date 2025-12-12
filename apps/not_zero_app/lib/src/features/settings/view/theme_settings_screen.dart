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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/models/theme_state.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class ThemeSettingsScreen extends ConsumerWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSettings = ref.watch(themeSettingsNotifierProvider);
    final themeStateController = ref.watch(
      themeSettingsNotifierProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.settings.theme.title),
      ),
      body: RadioGroup<ThemeState>(
        groupValue: themeSettings.themeState,
        onChanged: (value) {
          if (value != null && value != themeSettings.themeState) {
            themeStateController.setTheme(value);
          }
        },
        child: ListView(
          children: [
            RadioListTile<ThemeState>(
              title: Text(context.t.settings.theme.values.light),
              value: .light,
            ),
            RadioListTile<ThemeState>(
              title: Text(context.t.settings.theme.values.dark),
              value: .dark,
            ),
            RadioListTile<ThemeState>(
              title: Text(context.t.settings.theme.values.system),
              value: .system,
            ),
            const Divider(),
            if (Platform.isAndroid)
              SwitchListTile(
                value: themeSettings.useDynamicColors,
                onChanged: themeStateController.setUseDynamicColors,
                title: Text(
                  context.t.settings.theme.useDynamicColorsOption.title,
                ),
                subtitle: Text(
                  context.t.settings.theme.useDynamicColorsOption.subtitle,
                ),
              ),
            SwitchListTile(
              value: themeSettings.harmonizeColors,
              onChanged: themeStateController.setHarmonizeColors,
              title: Text(context.t.settings.theme.harmonizeColors.title),
              subtitle: Text(context.t.settings.theme.harmonizeColors.subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
