import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/helpers/file_helper.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';
import 'package:not_zero/units/tags/data/tags_local_service.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tasks/data/tasks_local_service.dart';
import 'package:not_zero/units/tasks/domain/models/task.dart';

@lazySingleton
class BackupLocalService {
  BackupLocalService(
    StorageProvider storage,
    this._tasksLocalService,
    this._tagsLocalService,
  ) {
    _settingsBox = storage.settings;
    _db = storage.database;
  }

  late final Box<String> _settingsBox;
  late final NotZeroDatabase _db;

  final TasksLocalService _tasksLocalService;
  final TagsLocalService _tagsLocalService;

  final log = Logger('BackupLocalService');

  Map<String, String> getAllSettings() {
    return _settingsBox.toMap().cast();
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final tasks = await _tasksLocalService.getTasks();
    return tasks.map((e) => e.toJson()).toList();
  }

  Future<List<Map<String, dynamic>>> getAllTags() async {
    final tags = await _tagsLocalService.getTags();
    return tags.map((e) => e.toJson()).toList();
  }

  Future<void> applyAllSettings(Map<String, String> settings) async {
    await _settingsBox.clear();
    await _settingsBox.putAll(settings);
  }

  Future<void> applyAllTasks(List<Map<String, dynamic>> tasks) {
    return _db.transaction(() async {
      await _db.delete(_db.tasksTable).go();
      for (final t in tasks) {
        final task = Task.fromJson(t);
        await _db.into(_db.tasksTable).insert(task.toInsertable());

        if (t.containsKey('tags')) {
          final taskTags = List<String>.from(t['tags'] as Iterable);
          for (final tag in taskTags) {
            await _db
                .into(_db.tasksTagEntries)
                .insert(TasksTagEntry(task: task.id, tag: tag));
          }
        }
      }
    });
  }

  Future<void> applyAllTags(List<Map<String, dynamic>> tags) {
    return _db.transaction(() async {
      await _db.delete(_db.tagsTable).go();
      for (final t in tags) {
        await _db
            .into(_db.tagsTable)
            .insert(ItemTag.fromJson(t).toInsertable());
      }
    });
  }

  Future<bool> exportDataToFile(BackupModel content) async {
    final bytesContent =
        Uint8List.fromList(utf8.encode(json.encode(content.toJson())));

    try {
      return await MultiplatformFileHelper.instance.saveFile(
        data: bytesContent,
        fileName: 'NotZero_Backup_${DateTime.now().toIso8601String()}.json',
        mimetype: 'application/json',
        allowedExtensions: ['json', 'yaml', 'yml'],
      );
    } catch (e, s) {
      log.warning('Error while saving file', e, s);
      return false;
    }
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
    } catch (e, s) {
      log.warning('Error while loading backup', e, s);
      return null;
    }
  }
}
