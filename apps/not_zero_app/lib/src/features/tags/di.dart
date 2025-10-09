import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/storage/di.dart';
import 'package:not_zero_app/src/features/tags/notifiers/tags_list_notifier.dart';
import 'package:not_zero_app/src/features/tags/repositories/tags_repository.dart';
import 'package:not_zero_app/src/features/tags/services/tags_local_service.dart';

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

final tagsListNotifierProvider = AsyncNotifierProvider.autoDispose(
  TagsListNotifier.new,
);
