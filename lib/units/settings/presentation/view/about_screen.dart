import 'package:flutter/material.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/i18n/strings.g.dart';
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
            title: Text(appInfo.name),
            subtitle: Text(appInfo.platform),
            trailing: Text('${appInfo.version} (${appInfo.buildNumber})'),
          ),
          SettingsBlocHeader(t.settings.about.blocks.links),
          SettingsMenuEntry(
            route: '/settings/about/licenses',
            title: t.settings.about.blocks.licenses,
          ),
        ],
      ),
    );
  }
}
