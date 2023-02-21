import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class ItemTag with _$ItemTag, ObjectIdMixin implements Comparable<ItemTag> {
  factory ItemTag({
    required String id,
    required String name,
    @Default(false) bool folder,
    @Default(0) int order,
  }) = _ItemTag;

  const ItemTag._();

  factory ItemTag.fromJson(Map<String, dynamic> json) =>
      _$ItemTagFromJson(json);

  @override
  int compareTo(ItemTag other) {
    if (order == other.order) {
      return name.compareTo(other.name);
    }

    return other.order.compareTo(order);
  }
}
