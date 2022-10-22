import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> waitAsync() => Future<void>.delayed(Duration.zero);

Future<void> testBlocSingle<Event, State>(
  Bloc<Event, State> bloc,
  Event eventToAdd,
  State expectedState,
) async {
  bloc.add(eventToAdd);
  await waitAsync();
  expect(bloc.state, expectedState);
}

Future<void> testCubitSingle<State>(
  Cubit<State> cubit,
  FutureOr<void> Function() run,
  State expectedState,
) async {
  await run();
  await waitAsync();
  expect(cubit.state, expectedState);
}
