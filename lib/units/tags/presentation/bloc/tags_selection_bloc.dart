import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';

part 'tags_selection_bloc.freezed.dart';
part 'tags_selection_event.dart';
part 'tags_selection_state.dart';

@injectable
class TagsSelectionBloc extends Bloc<TagsSelectionEvent, TagsSelectionState> {
  TagsSelectionBloc(this._repository)
      : super(const TagsSelectionState.loading()) {
    on<_LoadTagsEvent>(_onLoadTags);
    on<_SelectTagEvent>(_onSelectTags);
  }

  final TagsRepository _repository;

  Future<void> _onLoadTags(
    _LoadTagsEvent event,
    Emitter<TagsSelectionState> emit,
  ) async {
    await _repository.syncTags();

    await emit.forEach(
      _repository.getTags(),
      onData: (t) => TagsSelectionState.loaded(tags: t),
    );
  }

  Future<void> _onSelectTags(
    _SelectTagEvent event,
    Emitter<TagsSelectionState> emit,
  ) async {
    state.mapOrNull(loaded: (state) {
      final newSelection = {...state.selected};
      if (newSelection.contains(event.id)) {
        newSelection.remove(event.id);
      } else {
        newSelection.add(event.id);
      }

      emit(
        TagsSelectionState.loaded(
          tags: state.tags,
          selected: newSelection,
        ),
      );
    });
  }
}
