import 'dart:async';

import 'package:flutter/material.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/settings/domain/repositories/settings_repository.dart';
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
            onTap: () => _exportData(context),
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

  void _exportData(BuildContext context) {
    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.save),
            title: const Text('Exporting your data...'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );

    getIt<SettingsRepository>().exportData().then((result) {
      final infoText = result
          ? t.settings.storage.exportStatus.success
          : t.settings.storage.exportStatus.failure;

      Navigator.of(context, rootNavigator: true).pop();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(infoText)));
    });
  }
}
