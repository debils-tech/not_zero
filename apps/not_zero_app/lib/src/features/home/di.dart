import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero_app/src/features/stats/di.dart';

final StreamProvider<int?> homeScoreStreamProvider =
    StreamProvider.autoDispose<int?>((ref) async* {
      final repository = ref.watch(statsRepositoryProvider);

      yield null;

      unawaited(repository.countTotalPoints());

      yield* repository.getTotalPoints();
    });
