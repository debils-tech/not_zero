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
