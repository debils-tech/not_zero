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
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/view/components/list_elements.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.settings.list.title),
      ),
      body: ListView(
        children: [
          SettingsBlocHeader(context.t.settings.list.blocks.lookAndFeel),
          SettingsMenuEntry(
            route: '/settings/theme',
            icon: Icons.wb_sunny_outlined,
            title: context.t.settings.theme.title,
          ),
          const _SpecialEffectsSwitch(),
          SettingsBlocHeader(context.t.settings.list.blocks.other),
          SettingsMenuEntry(
            disabled: true,
            route: '/settings/storage',
            icon: Icons.import_export_rounded,
            title: context.t.settings.storage.title,
          ),
          SettingsMenuEntry(
            route: '/settings/about',
            icon: Icons.info_outline_rounded,
            title: context.t.settings.about.title,
          ),
        ],
      ),
    );
  }
}

class _SpecialEffectsSwitch extends ConsumerWidget {
  const _SpecialEffectsSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: ref.watch(specialEffectsNotifierProvider),
      onChanged: (value) {
        ref.read(specialEffectsNotifierProvider.notifier).setConfetti(value);
      },
      title: Text(context.t.settings.specialEffects.title),
    );
  }
}
