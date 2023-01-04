import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/app_info.dart';
import 'package:not_zero/units/settings/domain/models/backup_model.dart';

import '../tasks/template_tasks.dart';

void main() {
  test('Backup toJson', () {
    final settingsJson = {'a': 'b'};
    final tasksJson = templateTasks1.map((e) => e.toJson()).toList();

    final backup = BackupModel(
      appInfo: const AppInfo(
        name: 'Not Zero Test',
        platform: 'test',
        version: '0.0.0',
        buildNumber: 0,
      ),
      data: {
        'settings': settingsJson,
        'tasks': tasksJson,
      },
    );

    expect(
      backup.toJson(),
      {
        'version': 1,
        'appInfo': {
          'name': 'Not Zero Test',
          'platform': 'test',
          'version': '0.0.0',
          'build': 0
        },
        'data': {
          'settings': settingsJson,
          'tasks': tasksJson,
        }
      },
    );
  });

  test('Backup fromJson', () {
    final settingsJson = {'a': 'b'};
    final tasksJson = templateTasks1.map((e) => e.toJson()).toList();

    final backup = BackupModel.fromJson({
      'version': 1,
      'appInfo': {
        'name': 'Not Zero Test',
        'platform': 'test',
        'version': '0.0.0',
        'build': 0
      },
      'data': {
        'settings': settingsJson,
        'tasks': tasksJson,
      }
    });

    expect(backup.version, 1);
    expect(
      backup.appInfo,
      const AppInfo(
        name: 'Not Zero Test',
        platform: 'test',
        version: '0.0.0',
        buildNumber: 0,
      ),
    );
    expect(backup.data, {
      'settings': settingsJson,
      'tasks': tasksJson,
    });
  });
}
