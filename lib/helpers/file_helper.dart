import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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
    if (Platform.isAndroid || Platform.isIOS) {
      return _saveMobile(
        bytes: data,
        name: fileName,
        mimetype: mimetype,
      );
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
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
