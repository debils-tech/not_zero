import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/platform_checks.dart';
import 'package:not_zero/i18n/translations.g.dart';
import 'package:not_zero/units/settings/domain/repositories/settings_repository.dart';
import 'package:not_zero/units/settings/presentation/view/components/list_elements.dart';
import 'package:universal_io/io.dart';

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
            onTap: () => _importData(context),
            leading: const Icon(Icons.download),
            title: Text(t.settings.storage.importTitle),
          ),
        ],
      ),
    );
  }

  Future<void> _exportData(BuildContext context) async {
    _showDialog(
      context,
      icon: Icons.save,
      title: t.settings.storage.exportStatus.process,
    );

    final result = await getIt<SettingsRepository>().exportData();

    final infoText = result
        ? t.settings.storage.exportStatus.success
        : t.settings.storage.exportStatus.failure;

    Navigator.of(context, rootNavigator: true).pop();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(infoText)));
  }

  Future<void> _importData(BuildContext context) async {
    _showDialog(
      context,
      icon: Icons.download,
      title: t.settings.storage.importStatus.process,
    );

    final result = await getIt<SettingsRepository>().importData();

    Navigator.of(context, rootNavigator: true).pop();
    if (!result) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.settings.storage.importStatus.failure)),
      );
      return;
    }

    final closeDialogAction = [
      TextButton(
        onPressed: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else {
            exit(0);
          }
        },
        child: Text(t.settings.storage.closeAppButton),
      )
    ];

    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          // There is an option to close an app only on this platforms
          final isClosingSupported = Platform.isAndroid ||
              isPlatformDesktop;

          return AlertDialog(
            icon: const Icon(Icons.warning_amber_rounded),
            title: Text(t.settings.storage.importStatus.successTitle),
            content: Text(t.settings.storage.importStatus.success),
            actions: isClosingSupported ? closeDialogAction : null,
          );
        },
      ),
    );
  }

  void _showDialog(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) =>
      unawaited(
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              icon: const Icon(Icons.save),
              title: Text(title),
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
}
