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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/tags/di.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TagsListNotifier extends AsyncNotifier<List<ItemTag>> {
  @override
  Future<List<ItemTag>> build() {
    return ref.watch(tagsRepositoryProvider).getAllTags();
  }

  Future<void> addTag(ItemTag tag) {
    final newList = <ItemTag>[...state.value ?? []];

    final tagIndex = newList.indexWhere((element) => element.id == tag.id);
    if (tagIndex == -1) {
      newList.add(tag);
    } else {
      newList[tagIndex] = tag;
    }
    state = AsyncData(newList);

    return ref.watch(tagsRepositoryProvider).addTag(tag);
  }

  Future<void> deleteTag(String tagId) {
    final newList = <ItemTag>[...state.value ?? []];
    newList.removeWhere((element) => element.id == tagId);
    state = AsyncData(newList);
    return ref.watch(tagsRepositoryProvider).deleteTag(tagId);
  }
}
