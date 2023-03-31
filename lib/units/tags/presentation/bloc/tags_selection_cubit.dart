import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';

part 'tags_selection_cubit.freezed.dart';
part 'tags_selection_state.dart';

@injectable
class TagsSelectionCubit extends Cubit<TagsSelectionState> {
  TagsSelectionCubit(this._repository)
      : super(const TagsSelectionState.loading()) {
    _loadTags();
  }

  final TagsRepository _repository;
  StreamSubscription<List<ItemTag>>? _subscription;

  Future<void> _loadTags() async {
    await _repository.syncTags();

    _subscription = _repository
        .getTags()
        .listen((event) => emit(TagsSelectionState.loaded(tags: event)));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
