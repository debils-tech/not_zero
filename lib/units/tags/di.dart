import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/storage/di.dart';
import 'package:not_zero/units/tags/data/tags_local_service.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';
import 'package:not_zero/units/tags/presentation/bloc/tags_selection_cubit.dart';

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

// BLOC

final tagsSelectionCubitProvider =
    Provider.autoDispose<TagsSelectionCubit>((ref) {
  return TagsSelectionCubit(
    ref.watch(tagsRepositoryProvider),
  );
});
