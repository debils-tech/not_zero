part of 'tags_selection_bloc.dart';

@freezed
class TagsSelectionEvent with _$TagsSelectionEvent {
  const factory TagsSelectionEvent.loadTags() = _LoadTagsEvent;

  const factory TagsSelectionEvent.selectTag(String id) = _SelectTagEvent;
}
