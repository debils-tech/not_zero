import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tags/data/tags_local_service.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
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
    _tagsStreamController.add([
      tag,
      if (_tagsStreamController.hasValue) ..._tagsStreamController.value,
    ]);
    return _localService.saveTag(tag);
  }
}
