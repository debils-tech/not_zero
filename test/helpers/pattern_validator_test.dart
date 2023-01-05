import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('Correct test', () {
    for (var i = 0; i < 20; i++) {
      expect(PatternValidator.isUuid(const Uuid().v4()), isTrue);
    }
  });

  test('Incorrect test', () {
    expect(PatternValidator.isUuid(''), isFalse);
    expect(PatternValidator.isUuid('-1'), isFalse);
    expect(PatternValidator.isUuid('abc'), isFalse);
    expect(PatternValidator.isUuid(const Uuid().v4().substring(1)), isFalse);
  });
}
