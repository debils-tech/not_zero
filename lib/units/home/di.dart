import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/stats/di.dart';

final homeScoreStreamProvider = StreamProvider.autoDispose<int?>((ref) async* {
  final repository = ref.watch(statsRepositoryProvider);

  yield null;

  unawaited(repository.countTotalPoints());

  yield* repository.getTotalPoints();
});
