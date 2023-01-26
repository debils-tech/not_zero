import 'dart:convert';

import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:not_zero/components/web_save_dialog.dart';
import 'package:not_zero/helpers/global_navigation.dart';
import 'package:not_zero/helpers/platform_checks.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

abstract class MultiplatformFileHelper {
  static MultiplatformFileHelper? _instance;

  static MultiplatformFileHelper get instance =>
      _instance ??= _UniversalFileHelper();

  static set instance(MultiplatformFileHelper newInstance) =>
      _instance = newInstance;

  // TODO(uSlashVlad): Make this methods more universal for different usecases.

  Future<bool> saveFile({
    required Uint8List data,
    required String fileName,
    required String mimetype,
    required List<String> allowedExtensions,
  });

  Future<Uint8List?> loadFile({
    required List<String> allowedExtensions,
  });
}

class _UniversalFileHelper implements MultiplatformFileHelper {
  @override
  Future<bool> saveFile({
    required Uint8List data,
    required String fileName,
    required String mimetype,
    required List<String> allowedExtensions,
  }) {
    if (kIsWeb) {
      return _saveWeb(
        bytes: data,
        mimetype: mimetype,
      );
    } else if (isPlatformMobile) {
      return _saveMobile(
        bytes: data,
        name: fileName,
        mimetype: mimetype,
      );
    } else if (isPlatformDesktop) {
      return _saveDesktop(
        bytes: data,
        name: fileName,
        allowedExtensions: allowedExtensions,
      );
    } else {
      throw UnimplementedError('Saving file is not allowed on this platform');
    }
  }

  Future<bool> _saveMobile({
    required List<int> bytes,
    required String name,
    required String mimetype,
  }) async {
    try {
      await DocumentFileSavePlus.saveFile(
        Uint8List.fromList(bytes),
        name,
        mimetype,
      );
      return true;
    } catch (e, st) {
      debugPrint('Error while saving backup: $e');
      debugPrintStack(stackTrace: st);
      return false;
    }
  }

  static Future<bool> _saveDesktop({
    required List<int> bytes,
    required String name,
    required List<String> allowedExtensions,
  }) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final pathToSave = await FilePicker.platform.saveFile(
      fileName: name,
      initialDirectory: documentsDir.path,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      lockParentWindow: true,
    );
    if (pathToSave == null) return false;

    File(pathToSave).writeAsBytesSync(bytes);
    return true;
  }

  static Future<bool> _saveWeb({
    required List<int> bytes,
    required String mimetype,
  }) async {
    if (mimetype != 'application/json' && mimetype != 'text/plain') {
      throw UnimplementedError(
        'Unavailable file type for web dialog: "$mimetype"',
      );
    }

    await showDialog<void>(
      context: GlobalNavigation.context,
      builder: (_) => WebSaveDialog(utf8.decode(bytes)),
    );
    return true;
  }

  @override
  Future<Uint8List?> loadFile({required List<String> allowedExtensions}) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      allowCompression: false,
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
      lockParentWindow: true,
    );
    final filePath = pickedFile?.files.single.path;
    if (filePath == null) return null;

    return File(filePath).readAsBytes();
  }
}
