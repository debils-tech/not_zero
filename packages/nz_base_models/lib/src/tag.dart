// Not Zero, cross-platform wellbeing application.
// Copyright (C) 2025 Nagorny Vladislav
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nz_common/nz_common.dart';
import 'package:uuid/uuid.dart';

part 'tag.freezed.dart';

@freezed
abstract class ItemTag with _$ItemTag, ObjectIdMixin {
  factory ItemTag({
    required String id,
    required String name,
    required DateTime createdAt,
    @JsonKey(name: 'color') @Default(0) int colorIndex,
  }) = _ItemTag;

  const ItemTag._();

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
