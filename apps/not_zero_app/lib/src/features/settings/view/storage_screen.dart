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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:not_zero_app/src/features/settings/di.dart';
import 'package:not_zero_app/src/features/settings/repositories/backup_repository.dart';
import 'package:not_zero_app/src/features/settings/view/components/list_elements.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/features/translations/translations.g.dart';

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
          ListTile(
            onTap: () => _importData(context, backupRepository, ref: ref),
            leading: const Icon(Icons.publish_rounded),
            title: Text(context.t.settings.storage.importTitle),
          ),
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

    _showExportingDialog(
      context,
      icon: Icons.save_rounded,
      title: t.settings.storage.exportStatus.process,
    );

    final backupData = await backupRepository.backupLocalData();
    if (backupData == null) {
      messenger.showSnackBar(
        SnackBar(content: Text(t.settings.storage.exportStatus.failure)),
      );
      return;
    }

    navigator.pop();
    messenger.hideCurrentSnackBar();

    try {
      final backupFilePath = await FilePicker.platform.saveFile(
        dialogTitle: t.settings.storage.fileDialog.saveTitle,
        type: FileType.custom,
        allowedExtensions: ['tar.gz'],
        fileName: 'not_zero_backup_${DateTime.now().toIso8601String()}.tar.gz',
        bytes: backupData,
      );
      if (backupFilePath == null) return;

      messenger.showSnackBar(
        SnackBar(content: Text(t.settings.storage.exportStatus.success)),
      );
    } on Object catch (e, s) {
      Logger(
        'StorageSettingsScreen',
      ).severe('Failed to save backup data', e, s);
      messenger.showSnackBar(
        SnackBar(content: Text(t.settings.storage.exportStatus.failure)),
      );
    }
  }

  Future<void> _importData(
    BuildContext context,
    BackupRepository backupRepository, {
    required WidgetRef ref,
  }) async {
    final navigator = Navigator.of(context, rootNavigator: true);
    final messenger = ScaffoldMessenger.of(context);

    final filePicker = await FilePicker.platform.pickFiles(
      dialogTitle: t.settings.storage.fileDialog.openTitle,
      type: FileType.custom,
      allowedExtensions: ['tar.gz'],
      withData: true,
    );
    if (filePicker == null) return;

    final data = filePicker.files.firstOrNull?.bytes;
    if (data == null) return;

    _showExportingDialog(
      // TODO(uSlashVlad): It's bad, will be replaced with a proper route later
      // ignore: use_build_context_synchronously
      context,
      icon: Icons.download_rounded,
      title: t.settings.storage.importStatus.process,
    );

    final result = await backupRepository.restoreLocalData(data);

    navigator.pop();
    if (!result) {
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(content: Text(t.settings.storage.importStatus.failure)),
      );
      return;
    }

    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(content: Text(t.settings.storage.importStatus.success)),
    );

    // Re-creating all the connected providers to update the data in the whole app
    ref.invalidate(databaseProvider, asReload: true);
    ref.invalidate(settingsBoxProvider, asReload: true);
    ref.invalidate(tempBoxProvider, asReload: true);
  }

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
}
