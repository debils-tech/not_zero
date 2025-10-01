import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/features/tags/repositories/tags_repository.dart';
import 'package:not_zero_app/src/features/tags/services/tags_local_service.dart';
import 'package:nz_base_models/nz_base_models.dart';

final tagsLocalServiceProvider = Provider<TagsLocalService>((ref) {
  return TagsLocalService(
    ref.watch(databaseProvider),
  );
});

final tagsRepositoryProvider = Provider<TagsRepository>((ref) {
  return TagsRepository(
    ref.watch(tagsLocalServiceProvider),
  );
});

final StreamProvider<List<ItemTag>> tagsListStreamProvider =
    StreamProvider.autoDispose<List<ItemTag>>((
      ref,
    ) async* {
      final repository = ref.watch(tagsRepositoryProvider);

      await repository.syncTags();
      yield* repository.getTags();
    });
