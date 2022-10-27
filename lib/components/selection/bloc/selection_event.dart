import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_event.freezed.dart';

@freezed
class ItemSelectionEvent with _$ItemSelectionEvent {
  const factory ItemSelectionEvent.add(String item) = AddItemToSelectionEvent;
  const factory ItemSelectionEvent.remove(String item) =
      RemoveItemFromSelectionEvent;

  const factory ItemSelectionEvent.addAll(Set<String> items) =
      AddAllItemsToSelectionEvent;
  const factory ItemSelectionEvent.removeAll(Set<String>? items) =
      RemoveAllItemsFromSelectionEvent;
}
