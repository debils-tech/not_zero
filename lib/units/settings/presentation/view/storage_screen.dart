import 'package:flutter/material.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/settings/presentation/view/components/list_elements.dart';

class StorageSettingsScreen extends StatelessWidget {
  const StorageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.settings.storage.title)),
      body: ListView(
        children: [
          SettingsBlocHeader(t.settings.storage.aboutHeader),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 6, 15, 18),
            child: SelectableText(t.settings.storage.aboutContent),
          ),
          ListTile(
            onTap: () {
              // TODO(uSlashVlad): Add export functionality
            },
            leading: const Icon(Icons.save),
            title: Text(t.settings.storage.exportTitle),
          ),
          ListTile(
            onTap: () {
              // TODO(uSlashVlad): Add import functionality
            },
            leading: const Icon(Icons.download),
            title: Text(t.settings.storage.importTitle),
          ),
        ],
      ),
    );
  }
}
