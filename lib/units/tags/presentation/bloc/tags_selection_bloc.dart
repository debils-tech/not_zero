import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/units/tags/domain/repositories/tags_repository.dart';
import 'package:not_zero/units/tags/presentation/bloc/events/tags_selection_events.dart';
import 'package:not_zero/units/tags/presentation/bloc/states/tags_selection_states.dart';

@injectable
class TagsSelectionBloc extends Bloc<TagsSelectionEvent, TagsSelectionState> {
  TagsSelectionBloc(this._repository)
      : super(const TagsSelectionState.loading()) {
    on<LoadTagsEvent>(_onLoadTags);
    on<SelectTagEvent>(_onSelectTags);
  }

  final TagsRepository _repository;

  Future<void> _onLoadTags(
    LoadTagsEvent event,
    Emitter<TagsSelectionState> emit,
  ) async {
    await _repository.syncTags();

    await emit.forEach(
      _repository.getTags(),
      onData: (t) => TagsSelectionState.loaded(tags: t),
    );
  }

  Future<void> _onSelectTags(
    SelectTagEvent event,
    Emitter<TagsSelectionState> emit,
  ) async {
    final currentState = state;
    if (currentState is TagsLoadedState) {
      final newSelection = {...currentState.selected};
      if (newSelection.contains(event.id)) {
        newSelection.remove(event.id);
      } else {
        newSelection.add(event.id);
      }

      emit(
        TagsSelectionState.loaded(
          tags: currentState.tags,
          selected: newSelection,
        ),
      );
    }
  }
}
