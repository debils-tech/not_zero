import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/helpers/color_converter.dart';
import 'package:not_zero/helpers/object_id_mixin.dart';
import 'package:uuid/uuid.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class ItemTag with _$ItemTag, ObjectIdMixin {
  factory ItemTag({
    required String id,
    required String name,
    required DateTime createdAt,
    @ColorJsonConverter() Color? color,
  }) = _ItemTag;

  const ItemTag._();

  factory ItemTag.fromJson(Map<String, dynamic> json) =>
      _$ItemTagFromJson(json);

  factory ItemTag.create({required String name, Color? color}) => ItemTag(
        id: const Uuid().v4(),
        name: name,
        color: color,
        createdAt: DateTime.now(),
      );

  ItemTag edit({String? name, Color? color}) => copyWith(
        name: name ?? this.name,
        color: color ?? this.color,
      );
}
