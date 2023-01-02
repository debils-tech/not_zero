// import 'dart:convert';

// import 'package:document_file_save_plus/document_file_save_plus.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/constants/database.dart';
import 'package:not_zero/db/provider.dart';
import 'package:not_zero/units/settings/domain/models/theme_state.dart';
// import 'package:universal_io/io.dart';

@lazySingleton
class SettingsLocalService {
  SettingsLocalService(StorageProvider storage) {
    _db = storage.settings;
  }

  late final Box<String> _db;

  ThemeState? getThemeState() {
    final stringValue = _db.get(SettingsKeys.themeState);

    if (stringValue != null) {
      return ThemeState.values.byName(stringValue);
    }
    return null;
  }

  Future<void> setThemeState(ThemeState state) {
    return _db.put(SettingsKeys.themeState, state.name);
  }

  Future<bool> exportDataToFile(Map<String, dynamic> content) {
    // final bytesContent = utf8.encode(jsonEncode(content));
    // if (Platform.isAndroid || Platform.isIOS) {
    //   return _saveMobile(bytesContent);
    // } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    //   return _saveDesktop(bytesContent);
    // } else {
    //   throw UnimplementedError('Export is not available on web');
    // }
    return Future.value(true);
  }

  // Future<bool> _saveMobile(List<int> bytes) async {
  //   try {
  //     await DocumentFileSavePlus.saveFile(
  //       Uint8List.fromList(bytes),
  //       'NotZero_Backup.json',
  //       'application/json',
  //     );
  //     return true;
  //   } catch (e, st) {
  //     debugPrint('Error while saving backup: $e');
  //     debugPrintStack(stackTrace: st);
  //     return false;
  //   }
  // }

  // Future<bool> _saveDesktop(List<int> bytes) async {
  //   final pathToSave = await FilePicker.platform.saveFile(
  //     fileName: '',
  //     type: FileType.custom,
  //   );
  //   if (pathToSave == null) return false;

  //   File(pathToSave).writeAsBytesSync(bytes);
  //   return true;
  // }

  Future<Map<String, dynamic>> importDataFromFile() async {
    return {};
  }
}
