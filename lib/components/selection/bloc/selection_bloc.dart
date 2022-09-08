import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';

@injectable
class ItemSelectionBloc extends Bloc<ItemSelectionEvent, Set<String>> {
  ItemSelectionBloc() : super(<String>{}) {
    on<AddItemToSelectionEvent>(
      (event, emit) => emit({...state, event.item}),
    );
    on<RemoveItemFromSelectionEvent>(
      (event, emit) => emit({...state}..remove(event.item)),
    );
  }
}
