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

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/repositories/backup_repository.dart';
import 'package:not_zero_app/src/features/settings/view/components/list_elements.dart';
import 'package:nz_flutter_core/nz_flutter_core.dart';

class StorageSettingsScreen extends ConsumerWidget {
  const StorageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backupRepository = ref.watch(backupRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.t.settings.storage.title)),
      body: ListView(
        children: [
          SettingsBlocHeader(context.t.settings.storage.aboutHeader),
          Padding(
            padding: const .fromLTRB(15, 6, 15, 18),
            child: SelectableText(context.t.settings.storage.aboutContent),
          ),
          ListTile(
            onTap: () => _exportData(context, backupRepository),
            leading: const Icon(Icons.save_rounded),
            title: Text(context.t.settings.storage.exportTitle),
          ),
          // ListTile(
          //   // onTap: () => _importData(context),
          //   leading: const Icon(Icons.download_rounded),
          //   title: Text(context.t.settings.storage.importTitle),
          // ),
        ],
      ),
    );
  }

  Future<void> _exportData(
    BuildContext context,
    BackupRepository backupRepository,
  ) async {
    final navigator = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final backupFilePath = await FilePicker.platform.saveFile(
      dialogTitle: context.t.settings.storage.fileDialog.saveTitle,
      type: FileType.custom,
      allowedExtensions: ['tar.gz'],
      fileName: 'not_zero_backup_${DateTime.now().toIso8601String()}.tar.gz',
    );
    if (backupFilePath == null) return;

    _showExportingDialog(
      // TODO(uSlashVlad): Rewrite this to proper dialog.
      // ignore: use_build_context_synchronously
      context,
      icon: Icons.save_rounded,
      title: t.settings.storage.exportStatus.process,
    );

    final result = await backupRepository.backupLocalData(File(backupFilePath));

    final infoText = result
        ? t.settings.storage.exportStatus.success
        : t.settings.storage.exportStatus.failure;

    navigator.pop();
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(content: Text(infoText)));
  }
  //
  // Future<void> _importData(BuildContext context) async {
  //   _showExportingDialog(
  //     icon: Icons.download_rounded,
  //     title: t.settings.storage.importStatus.process,
  //   );
  //
  //   final navigator = Navigator.of(context, rootNavigator: true);
  //   final messenger = ScaffoldMessenger.of(context);
  //
  //   final result = await getIt<SettingsRepository>().importData();
  //
  //   navigator.pop();
  //   if (!result) {
  //     messenger.hideCurrentSnackBar();
  //     messenger.showSnackBar(
  //       SnackBar(content: Text(t.settings.storage.importStatus.failure)),
  //     );
  //     return;
  //   }
  //
  //   final closeDialogAction = [
  //     TextButton(
  //       onPressed: () {
  //         if (Platform.isAndroid) {
  //           SystemNavigator.pop();
  //         } else {
  //           exit(0);
  //         }
  //       },
  //       child: Text(t.settings.storage.closeAppButton),
  //     ),
  //   ];
  //
  //   _showSuccessfulImportDialog(actions: closeDialogAction);
  // }

  void _showExportingDialog(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(Icons.save_rounded),
        title: Text(title),
        content: const Row(
          mainAxisAlignment: .center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
  //
  // void _showSuccessfulImportDialog({List<Widget>? actions}) => unawaited(
  //       showDialog(
  //         context: GlobalNavigation.context,
  //         barrierDismissible: false,
  //         builder: (context) {
  //           // There is an option to close an app only on this platforms
  //           final isClosingSupported = Platform.isAndroid || isPlatformDesktop;
  //
  //           return AlertDialog(
  //             icon: const Icon(Icons.warning_amber_rounded),
  //             title: Text(t.settings.storage.importStatus.successTitle),
  //             content: Text(t.settings.storage.importStatus.success),
  //             actions: isClosingSupported ? actions : null,
  //           );
  //         },
  //       ),
  //     );
}
