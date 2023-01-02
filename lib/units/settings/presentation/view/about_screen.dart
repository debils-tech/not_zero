import 'package:flutter/material.dart';
import 'package:not_zero/constants/links.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/helpers/not_zero_icons.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/settings/presentation/view/components/list_elements.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appInfo = getIt<AppInfo>();
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.about.title),
      ),
      body: ListView(
        children: [
          SettingsBlocHeader(t.settings.about.blocks.version),
          ListTile(
            title: SelectableText(appInfo.name),
            subtitle: SelectableText(appInfo.platform),
            trailing:
                SelectableText('${appInfo.version} (${appInfo.buildNumber})'),
          ),
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
