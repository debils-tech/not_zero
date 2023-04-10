import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/helpers/pattern_validator.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';

import '../../template_tags.dart';

void main() {
  test('Tag create', () {
    final timeBeforeCreation = DateTime.now();
    final tag = ItemTag.create(name: 'Test tag', colorIndex: 1);

    expect(tag.id, matches(PatternValidator.uuidPattern));
    expect(tag.name, 'Test tag');
    expect(tag.colorIndex, 1);
    expect(tag.createdAt.isAfter(timeBeforeCreation), isTrue);
  });

  test('Tag edit with fields', () {
    final originalTag = templateTags.first;
    final tag = originalTag.edit(name: 'Edited name', colorIndex: 5);

    expect(tag.id, originalTag.id);
    expect(tag.name, 'Edited name');
    expect(tag.colorIndex, 5);
    expect(tag.createdAt, tag.createdAt);
  });

  test('Tag edit without fields', () {
    final originalTag = templateTags.first;
    final tag = originalTag.edit();

    expect(tag, originalTag);
  });

  test('Tag toJson', () {
    final tag = templateTags.first;

    expect(tag.toJson(), {
      'id': tag.id,
      'name': tag.name,
      'createdAt': tag.createdAt.toIso8601String(),
      'color': tag.colorIndex,
    });
  });

  test('Tag fromJson', () {
    final tag = templateTags.first;
    final recreatedTag = ItemTag.fromJson(tag.toJson());

    expect(recreatedTag, tag);
  });
}
