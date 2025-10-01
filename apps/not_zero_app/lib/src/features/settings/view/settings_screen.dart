import 'package:flutter/material.dart';
import 'package:not_zero_app/src/features/settings/view/components/list_elements.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

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
            disabled: true,
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
