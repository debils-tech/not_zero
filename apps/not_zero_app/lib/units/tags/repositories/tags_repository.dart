import 'package:not_zero_app/units/tags/services/tags_local_service.dart';
import 'package:nz_tags_models/nz_tags_models.dart';
import 'package:rxdart/rxdart.dart';

class TagsRepository {
  TagsRepository(this._localService);

  final TagsLocalService _localService;

  final _tagsStreamController = BehaviorSubject<List<ItemTag>>();

  Stream<List<ItemTag>> getTags() => _tagsStreamController;

  Future<void> syncTags() async {
    final localTags = await _localService.getTags();
    _tagsStreamController.add(localTags);
  }

  Future<void> addTag(ItemTag tag) {
    final listCopy = [
      if (_tagsStreamController.hasValue) ..._tagsStreamController.value,
    ];

    final tagIndex = listCopy.indexWhere((element) => element.id == tag.id);
    if (tagIndex == -1) {
      listCopy.add(tag);
    } else {
      listCopy[tagIndex] = tag;
    }

    _tagsStreamController.add(listCopy);
    return _localService.saveTag(tag);
  }

  Future<void> deleteTag(String tagId) {
    final newList = [..._tagsStreamController.value]
      ..removeWhere((element) => element.id == tagId);
    _tagsStreamController.add(newList);
    return _localService.deleteTag(tagId);
  }
}
