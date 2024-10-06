import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_entry.freezed.dart';
part 'score_entry.g.dart';

@freezed
class ScoreEntry with _$ScoreEntry {
  const factory ScoreEntry({
    required String id,
    required DateTime createdAt,
    required int score,
    required ScoreEntryType scoreType,
    @Default(ScoreEntryMetadata.none()) ScoreEntryMetadata metadata,
  }) = _ScoreEntry;

  factory ScoreEntry.fromJson(Map<String, Object?> json) =>
      _$ScoreEntryFromJson(json);
}

enum ScoreEntryType {
  @JsonValue('task')
  task,

  @JsonValue('login')
  login,
}

@freezed
sealed class ScoreEntryMetadata with _$ScoreEntryMetadata {
  const factory ScoreEntryMetadata.none() = ScoreEntryMetadataNone;

  const factory ScoreEntryMetadata.task({
    @JsonKey(name: 'task_id') required String associatedTaskId,
  }) = ScoreEntryMetadataTask;

  factory ScoreEntryMetadata.fromJson(Map<String, Object?> json) =>
      _$ScoreEntryMetadataFromJson(json);
}
