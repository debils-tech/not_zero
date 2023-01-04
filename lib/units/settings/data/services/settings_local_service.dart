import 'dart:convert';

import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

@lazySingleton
class SettingsLocalService {
  SettingsLocalService(StorageProvider storage) {
    _settingsBox = storage.settings;
    _db = storage.database;
  }

  late final Box<String> _settingsBox;
  late final NotZeroDatabase _db;

  ThemeState? getThemeState() {
    final stringValue = _settingsBox.get(SettingsKeys.themeState);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _settingsBox.put(SettingsKeys.themeState, state.name);
  }

  Map<String, String> exportAllSettings() {
    return _settingsBox.toMap().cast();
  }

  Future<List<Map<String, dynamic>>> exportAllTasks() async {
    final tasks = await _db.select(_db.tasksTable).get();
    return tasks.map((e) => e.toJson()).toList();
  }

  Future<bool> exportDataToFile(Map<String, dynamic> content) {
    final bytesContent = utf8.encode(jsonEncode(content));
    if (Platform.isAndroid || Platform.isIOS) {
      return _saveMobile(bytesContent);
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      return _saveDesktop(bytesContent);
    } else {
      throw UnimplementedError('Export is not available on web');
    }
  }

  Future<bool> _saveMobile(List<int> bytes) async {
    try {
      await DocumentFileSavePlus.saveFile(
        Uint8List.fromList(bytes),
        _backupFileName,
        'application/json',
      );
      return true;
    } catch (e, st) {
      debugPrint('Error while saving backup: $e');
      debugPrintStack(stackTrace: st);
      return false;
    }
  }

  Future<bool> _saveDesktop(List<int> bytes) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final pathToSave = await FilePicker.platform.saveFile(
      fileName: _backupFileName,
      initialDirectory: documentsDir.path,
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (pathToSave == null) return false;

    File(pathToSave).writeAsBytesSync(bytes);
    return true;
  }

  String get _backupFileName =>
      'NotZero_Backup_${DateTime.now().toIso8601String()}.json';

  Future<Map<String, dynamic>> importDataFromFile() async {
    return {};
  }
}
