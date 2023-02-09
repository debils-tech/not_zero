import 'package:flutter_test/flutter_test.dart';
import 'package:not_zero/components/selection/bloc/selection_bloc.dart';
import 'package:not_zero/components/selection/bloc/selection_event.dart';
import 'package:not_zero/get_it.dart';
import 'package:uuid/uuid.dart';

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

  test('Initial state', () {
    final bloc = getIt<ItemSelectionBloc>();
    expect(bloc.state, <String>{});
  });

  test('Add items', () async {
    final bloc = getIt<ItemSelectionBloc>();

    bloc.add(ItemSelectionEvent.add(uuids[0]));
    await expectLater(bloc.stream, emits({uuids[0]}));

    bloc.add(ItemSelectionEvent.add(uuids[1]));
    await expectLater(bloc.stream, emits({uuids[0], uuids[1]}));

    bloc.add(ItemSelectionEvent.add(uuids[2]));
    await expectLater(bloc.stream, emits({uuids[0], uuids[1], uuids[2]}));
  });

  test('Add and remove', () async {
    final bloc = getIt<ItemSelectionBloc>();

    bloc.add(ItemSelectionEvent.add(uuids[0]));
    await expectLater(bloc.stream, emits({uuids[0]}));

    bloc.add(ItemSelectionEvent.remove(uuids[0]));
    await expectLater(bloc.stream, emits(<String>{}));

    bloc.add(ItemSelectionEvent.add(uuids[1]));
    await expectLater(bloc.stream, emits({uuids[1]}));

    bloc.add(ItemSelectionEvent.add(uuids[0]));
    await expectLater(bloc.stream, emits({uuids[0], uuids[1]}));

    bloc.add(ItemSelectionEvent.remove(uuids[0]));
    await expectLater(bloc.stream, emits({uuids[1]}));
  });

  test('Add multiple', () async {
    final bloc = getIt<ItemSelectionBloc>();

    expect(
      bloc.stream,
      emitsInOrder([
        <String>{uuids[0], uuids[1]},
        <String>{uuids[0], uuids[1], uuids[2], uuids[3]},
      ]),
    );

    bloc
      ..add(ItemSelectionEvent.addAll({uuids[0], uuids[1]}))
      // This specific event (empty set) shouldn't emit event.
      ..add(const ItemSelectionEvent.addAll({}))
      ..add(ItemSelectionEvent.addAll({uuids[1], uuids[2], uuids[3]}));
  });

  test('Add and remove multiple', () {
    final bloc = getIt<ItemSelectionBloc>();

    expect(
      bloc.stream,
      emitsInOrder([
        <String>{uuids[0], uuids[1], uuids[2], uuids[3]},
        <String>{uuids[1]},
      ]),
    );

    bloc
      ..add(ItemSelectionEvent.addAll({uuids[0], uuids[1], uuids[2], uuids[3]}))
      // This specific event (empty set) shouldn't emit event.
      ..add(const ItemSelectionEvent.removeAll({}))
      ..add(ItemSelectionEvent.removeAll({uuids[0], uuids[2], uuids[3]}));
  });
}
