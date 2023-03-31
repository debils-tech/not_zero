part of 'tags_selection_cubit.dart';

@freezed
class TagsSelectionState with _$TagsSelectionState {
  const factory TagsSelectionState.loading() = _TagsLoadingState;

  const factory TagsSelectionState.loaded({@Default([]) List<ItemTag> tags}) =
      _TagsLoadedState;

  const TagsSelectionState._();

  List<ItemTag> filterOn(Set<String> filter) {
    return map(
      loading: (_) => [],
      loaded: (state) => state.tags
          .where((element) => filter.contains(element.id))
          .toList(growable: false),
    );
  }
}
