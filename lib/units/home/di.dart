import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_cubit.dart';
import 'package:not_zero/units/stats/di.dart';

// BLOC

final homeScoreCubitProvider = Provider.autoDispose<HomeScoreCubit>((ref) {
  return HomeScoreCubit(
    ref.watch(statsRepositoryProvider),
  );
});
