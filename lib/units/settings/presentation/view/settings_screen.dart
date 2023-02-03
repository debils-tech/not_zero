import 'package:flutter/material.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/settings/presentation/view/components/list_elements.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.list.title),
      ),
      body: ListView(
        children: [
          SettingsBlocHeader(t.settings.list.blocks.lookAndFeel),
          SettingsMenuEntry(
            route: '/settings/theme',
            icon: Icons.wb_sunny_outlined,
            title: t.settings.theme.title,
          ),
          SettingsBlocHeader(t.settings.list.blocks.other),
          SettingsMenuEntry(
            route: '/settings/storage',
            icon: Icons.import_export_rounded,
            title: t.settings.storage.title,
          ),
          SettingsMenuEntry(
            route: '/settings/about',
            icon: Icons.info_outline_rounded,
            title: t.settings.about.title,
          ),
        ],
      ),
    );
  }
}
