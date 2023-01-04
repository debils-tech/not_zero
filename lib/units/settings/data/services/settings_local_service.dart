import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/helpers/file_helper.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

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

  Map<String, String> getAllSettings() {
    return _settingsBox.toMap().cast();
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final tasks = await _db.select(_db.tasksTable).get();
    return tasks.map((e) => e.toJson()).toList();
  }

  Future<void> applyAllSettings(Map<String, String> settings) async {
    await _settingsBox.clear();
    await _settingsBox.putAll(settings);
  }

  Future<void> applyAllTasks(List<Map<String, dynamic>> tasks) {
    return _db.transaction(() async {
      await _db.delete(_db.tasksTable).go();
      for (final t in tasks) {
        await _db.into(_db.tasksTable).insert(Task.fromJson(t).toInsertable());
      }
    });
  }

  Future<bool> exportDataToFile(BackupModel content) {
    final bytesContent =
        Uint8List.fromList(utf8.encode(json.encode(content.toJson())));

    return MultiplatformFileHelper.instance.saveFile(
      data: bytesContent,
      fileName: 'NotZero_Backup_${DateTime.now().toIso8601String()}.json',
      mimetype: 'application/json',
      allowedExtensions: ['json', 'yaml', 'yml'],
    );
  }

  Future<BackupModel?> importDataFromFile() async {
    try {
      final backupContent = await MultiplatformFileHelper.instance.loadFile(
        allowedExtensions: ['json'],
      );
      if (backupContent == null) return null;

      return BackupModel.fromJson(
        json.decode(utf8.decode(backupContent)) as Map<String, dynamic>,
      );
    } catch (e, st) {
      debugPrint('Error while loading backup: $e');
      debugPrintStack(stackTrace: st);
      return null;
    }
  }
}
