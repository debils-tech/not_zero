import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_common/nz_common.dart';
import 'package:uuid/uuid.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
abstract class ItemTag with _$ItemTag, ObjectIdMixin {
  factory ItemTag({
    required String id,
    required String name,
    required DateTime createdAt,
    @JsonKey(name: 'color') @Default(0) int colorIndex,
  }) = _ItemTag;

  const ItemTag._();

  factory ItemTag.fromJson(Map<String, dynamic> json) =>
      _$ItemTagFromJson(json);

  factory ItemTag.create({required String name, int? colorIndex}) => ItemTag(
    id: const Uuid().v4(),
    name: name,
    colorIndex: colorIndex ?? 0,
    createdAt: DateTime.now(),
  );

  ItemTag edit({String? name, int? colorIndex}) => copyWith(
    name: name ?? this.name,
    colorIndex: colorIndex ?? this.colorIndex,
  );

  static List<String> tagsToIds(List<ItemTag> field) =>
      field.map((e) => e.id).toList();
}
