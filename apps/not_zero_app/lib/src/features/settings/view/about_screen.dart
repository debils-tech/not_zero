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
import 'package:not_zero_app/src/features/settings/constants/links.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/view/components/list_elements.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';
import 'package:not_zero_app/src/helpers/not_zero_icons.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.settings.about.title),
      ),
      body: ListView(
        children: [
          SettingsBlocHeader(context.t.settings.about.blocks.version),
          const _AppInfoTile(),
          SettingsBlocHeader(context.t.settings.about.blocks.links),
          SettingsUrlEntry(
            url: ContactLinks.telegram,
            title: context.t.settings.about.blocks.telegram,
            icon: NotZeroIcons.telegram_plane,
          ),
          SettingsUrlEntry(
            url: ContactLinks.repository,
            title: context.t.settings.about.blocks.repository,
            icon: NotZeroIcons.github_circled,
          ),
          SettingsMenuEntry(
            route: '/settings/about/licenses',
            title: context.t.settings.about.blocks.licenses,
          ),
        ],
      ),
    );
  }
}

class _AppInfoTile extends ConsumerWidget {
  const _AppInfoTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appInfo = ref.watch(appInfoProvider);

    return switch (appInfo) {
      AsyncData(:final value) => ListTile(
        title: SelectableText(value.name),
        subtitle: SelectableText(value.platform),
        trailing: SelectableText('${value.version} (${value.buildNumber})'),
      ),
      _ => const ListTile(
        title: LinearProgressIndicator(),
      ),
    };
  }
}
