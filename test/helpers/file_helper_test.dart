import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/file_helper.dart';

void main() {
  group('Set & get custom instance', () {
    MultiplatformFileHelper.instance = _CustomFileHelper();

    test('Check save file', () async {
      expect(
        await MultiplatformFileHelper.instance.saveFile(
          data: Uint8List(0),
          fileName: '',
          mimetype: '',
          allowedExtensions: [],
        ),
        true,
      );

      expect(
        await MultiplatformFileHelper.instance.saveFile(
          data: Uint8List(0),
          fileName: '',
          mimetype: '',
          allowedExtensions: [],
        ),
        false,
      );

      expect(
        await MultiplatformFileHelper.instance.saveFile(
          data: Uint8List(0),
          fileName: '',
          mimetype: '',
          allowedExtensions: [],
        ),
        true,
      );
    });

    test('Check load file', () async {
      expect(
        await MultiplatformFileHelper.instance.loadFile(allowedExtensions: []),
        [0, 1, 2, 3, 4, 5],
      );

      expect(
        await MultiplatformFileHelper.instance.loadFile(allowedExtensions: []),
        [0],
      );

      expect(
        await MultiplatformFileHelper.instance.loadFile(allowedExtensions: []),
        isNull,
      );

      expect(
        await MultiplatformFileHelper.instance.loadFile(allowedExtensions: []),
        [0, 1, 2, 3, 4, 5],
      );
    });
  });
}

class _CustomFileHelper implements MultiplatformFileHelper {
  var _loadCounter = 0;
  var _saveConter = 0;

  @override
  Future<bool> saveFile({
    required Uint8List data,
    required String fileName,
    required String mimetype,
    required List<String> allowedExtensions,
  }) {
    if ((_saveConter++).isEven) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<Uint8List?> loadFile({required List<String> allowedExtensions}) {
    switch (_loadCounter++ % 3) {
      case 0:
        return Future.value(Uint8List.fromList([0, 1, 2, 3, 4, 5]));
      case 1:
        return Future.value(Uint8List.fromList([0]));
      default:
        return Future.value();
    }
  }
}
