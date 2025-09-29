import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScoreStreamProvider = StreamProvider.autoDispose<int?>((ref) async* {
  // final repository = ref.watch(statsRepositoryProvider);

  yield null;

  // unawaited(repository.countTotalPoints());
  //
  // yield* repository.getTotalPoints();
});
