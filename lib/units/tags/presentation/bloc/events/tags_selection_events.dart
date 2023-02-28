import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags_selection_events.freezed.dart';

@freezed
class TagsSelectionEvent with _$TagsSelectionEvent {
  const factory TagsSelectionEvent.loadTags() = LoadTagsEvent;

  const factory TagsSelectionEvent.selectTag(String id) = SelectTagEvent;
}
