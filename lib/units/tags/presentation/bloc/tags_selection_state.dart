part of 'tags_selection_bloc.dart';

@freezed
class TagsSelectionState with _$TagsSelectionState {
  const factory TagsSelectionState.loading() = _TagsLoadingState;

  const factory TagsSelectionState.loaded({
    @Default([]) List<ItemTag> tags,
    @Default({}) Set<String> selected,
  }) = _TagsLoadedState;
}
