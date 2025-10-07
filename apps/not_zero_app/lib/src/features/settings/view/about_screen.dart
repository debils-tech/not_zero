import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/settings/constants/links.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/view/components/list_elements.dart';
import 'package:not_zero_app/src/helpers/not_zero_icons.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.about.title),
      ),
      body: ListView(
        children: [
          SettingsBlocHeader(t.settings.about.blocks.version),
          const _AppInfoTile(),
          SettingsBlocHeader(t.settings.about.blocks.links),
          SettingsUrlEntry(
            url: ContactLinks.telegram,
            title: t.settings.about.blocks.telegram,
            icon: NotZeroIcons.telegram_plane,
          ),
          SettingsUrlEntry(
            url: ContactLinks.repository,
            title: t.settings.about.blocks.repository,
            icon: NotZeroIcons.github_circled,
          ),
          SettingsMenuEntry(
            route: '/settings/about/licenses',
            title: t.settings.about.blocks.licenses,
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
