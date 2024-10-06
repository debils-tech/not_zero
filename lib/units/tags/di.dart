import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/helpers/async_object_wrapper.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:not_zero/units/tags/repositories/tags_repository.dart';
import 'package:not_zero/units/tags/services/tags_local_service.dart';
import 'package:nz_tags_models/nz_tags_models.dart';

final tagsLocalServiceProvider = Provider<TagsLocalService>((ref) {
  return TagsLocalService(
    ref.watch(databaseProvider),
  );
});

final tagsRepositoryProvider = Provider<TagsRepository>((ref) {
  return asyncRef(
    ref,
    TagsRepository(
      ref.watch(tagsLocalServiceProvider),
    ),
  );
});

final tagsListStreamProvider =
    StreamProvider.autoDispose<List<ItemTag>>((ref) async* {
  final repository = ref.watch(tagsRepositoryProvider);

  await repository.syncTags();
  yield* repository.getTags();
});
