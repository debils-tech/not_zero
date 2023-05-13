import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:not_zero/get_it.dart';
import 'package:not_zero/helpers/global_navigation.dart';
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
            leading: const Icon(Icons.save_rounded),
            title: Text(t.settings.storage.exportTitle),
          ),
          ListTile(
            onTap: () => _importData(context),
            leading: const Icon(Icons.download_rounded),
            title: Text(t.settings.storage.importTitle),
          ),
        ],
      ),
    );
  }

  Future<void> _exportData(BuildContext context) async {
    _showExportingDialog(
      icon: Icons.save_rounded,
      title: t.settings.storage.exportStatus.process,
    );

    final navigator = Navigator.of(context, rootNavigator: true);
    final messenger = ScaffoldMessenger.of(context);

    final result = await getIt<SettingsRepository>().exportData();

    final infoText = result
        ? t.settings.storage.exportStatus.success
        : t.settings.storage.exportStatus.failure;

    navigator.pop();
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(content: Text(infoText)));
  }

  Future<void> _importData(BuildContext context) async {
    _showExportingDialog(
      icon: Icons.download_rounded,
      title: t.settings.storage.importStatus.process,
    );

    final navigator = Navigator.of(context, rootNavigator: true);
    final messenger = ScaffoldMessenger.of(context);

    final result = await getIt<SettingsRepository>().importData();

    navigator.pop();
    if (!result) {
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
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

    _showSuccessfulImportDialog(actions: closeDialogAction);
  }

  void _showExportingDialog({
    required IconData icon,
    required String title,
  }) =>
      unawaited(
        showDialog(
          context: GlobalNavigation.context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              icon: const Icon(Icons.save_rounded),
              title: Text(title),
              content: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      );

  void _showSuccessfulImportDialog({List<Widget>? actions}) => unawaited(
        showDialog(
          context: GlobalNavigation.context,
          barrierDismissible: false,
          builder: (context) {
            // There is an option to close an app only on this platforms
            final isClosingSupported = Platform.isAndroid || isPlatformDesktop;

            return AlertDialog(
              icon: const Icon(Icons.warning_amber_rounded),
              title: Text(t.settings.storage.importStatus.successTitle),
              content: Text(t.settings.storage.importStatus.success),
              actions: isClosingSupported ? actions : null,
            );
          },
        ),
      );
}
