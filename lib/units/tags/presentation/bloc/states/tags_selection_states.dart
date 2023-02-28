import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:not_zero/units/tags/domain/models/tag.dart';

part 'tags_selection_states.freezed.dart';

@freezed
class TagsSelectionState with _$TagsSelectionState {
  const factory TagsSelectionState.loading() = TagsLoadingState;

  const factory TagsSelectionState.loaded({
    @Default([]) List<ItemTag> tags,
    @Default({}) Set<String> selected,
  }) = TagsLoadedState;
}
