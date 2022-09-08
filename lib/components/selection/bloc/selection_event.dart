import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_event.freezed.dart';

@freezed
class ItemSelectionEvent with _$ItemSelectionEvent {
  const factory ItemSelectionEvent.add(String item) = AddItemToSelectionEvent;
  const factory ItemSelectionEvent.remove(String item) =
      RemoveItemFromSelectionEvent;
}
