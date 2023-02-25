import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/color_converter.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class ItemTag with _$ItemTag, ObjectIdMixin {
  factory ItemTag({
    required String id,
    required String name,
    @ColorJsonConverter() Color? color,
  }) = _ItemTag;

  const ItemTag._();

  factory ItemTag.fromJson(Map<String, dynamic> json) =>
      _$ItemTagFromJson(json);
}
