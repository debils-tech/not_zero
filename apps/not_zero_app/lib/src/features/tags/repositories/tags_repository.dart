import 'package:not_zero_app/src/features/tags/services/tags_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';

class TagsRepository {
  const TagsRepository(this._localService);

  final TagsLocalService _localService;

  Future<List<ItemTag>> getAllTags() => _localService.getTags();

  Future<void> addTag(ItemTag tag) => _localService.saveTag(tag);

  Future<void> deleteTag(String tagId) => _localService.deleteTag(tagId);
}
