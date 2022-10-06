import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_score_state.freezed.dart';

@freezed
class HomeScoreState with _$HomeScoreState {
  const factory HomeScoreState({int? totalPoints}) = _HomeScoreState;
}
