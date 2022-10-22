import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../async.dart';
import '../../global_init.dart';

void main() {
  globalInit();

  final uuids = [
    const Uuid().v4(),
    const Uuid().v4(),
    const Uuid().v4(),
    const Uuid().v4(),
    const Uuid().v4(),
  ];

  test('Add items', () async {
    final bloc = getIt<ItemSelectionBloc>();

    expect(bloc.state, <String>{});

    await testBlocSingle(
      bloc,
      AddItemToSelectionEvent(uuids[0]),
      <String>{uuids[0]},
    );

    await testBlocSingle(
      bloc,
      AddItemToSelectionEvent(uuids[1]),
      <String>{uuids[0], uuids[1]},
    );

    await testBlocSingle(
      bloc,
      AddItemToSelectionEvent(uuids[2]),
      <String>{uuids[0], uuids[1], uuids[2]},
    );
  });

  test('Add and remove', () {
    final bloc = getIt<ItemSelectionBloc>();

    expect(bloc.state, <String>{});

    expect(
      bloc.stream,
      emitsInOrder([
        <String>{uuids[0]},
        <String>{},
        <String>{uuids[0]},
        <String>{uuids[0], uuids[1]},
        <String>{uuids[1]},
      ]),
    );

    bloc
      ..add(AddItemToSelectionEvent(uuids[0]))
      ..add(RemoveItemFromSelectionEvent(uuids[0]))
      ..add(AddItemToSelectionEvent(uuids[0]))
      ..add(AddItemToSelectionEvent(uuids[1]))
      ..add(RemoveItemFromSelectionEvent(uuids[0]));
  });

  test('Add multiple', () {
    final bloc = getIt<ItemSelectionBloc>();

    expect(bloc.state, <String>{});

    expect(
      bloc.stream,
      emitsInOrder([
        <String>{uuids[0], uuids[1]},
        <String>{uuids[0], uuids[1], uuids[2], uuids[3]},
      ]),
    );

    bloc
      ..add(AddAllItemsToSelectionEvent({uuids[0], uuids[1]}))
      ..add(const AddAllItemsToSelectionEvent({}))
      ..add(
        AddAllItemsToSelectionEvent({uuids[1], uuids[2], uuids[3]}),
      );
  });

  test('Add and remove multiple', () {
    final bloc = getIt<ItemSelectionBloc>();

    expect(bloc.state, <String>{});

    expect(
      bloc.stream,
      emitsInOrder([
        <String>{uuids[0], uuids[1], uuids[2], uuids[3]},
        <String>{uuids[1]},
      ]),
    );

    bloc
      ..add(
        AddAllItemsToSelectionEvent({uuids[0], uuids[1], uuids[2], uuids[3]}),
      )
      ..add(const RemoveAllItemsFromSelectionEvent({}))
      ..add(RemoveAllItemsFromSelectionEvent({uuids[0], uuids[2], uuids[3]}));
  });
}
