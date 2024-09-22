// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreEntryImpl _$$ScoreEntryImplFromJson(Map<String, dynamic> json) =>
    _$ScoreEntryImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      score: (json['score'] as num).toInt(),
      scoreType: $enumDecode(_$ScoreEntryTypeEnumMap, json['score_type']),
      metadata: json['metadata'] == null
          ? const ScoreEntryMetadata.none()
          : ScoreEntryMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScoreEntryImplToJson(_$ScoreEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'score': instance.score,
      'score_type': _$ScoreEntryTypeEnumMap[instance.scoreType]!,
      'metadata': instance.metadata,
    };

const _$ScoreEntryTypeEnumMap = {
  ScoreEntryType.task: 'task',
};

_$ScoreEntryMetadataNoneImpl _$$ScoreEntryMetadataNoneImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoreEntryMetadataNoneImpl(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ScoreEntryMetadataNoneImplToJson(
        _$ScoreEntryMetadataNoneImpl instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$ScoreEntryMetadataTaskImpl _$$ScoreEntryMetadataTaskImplFromJson(
        Map<String, dynamic> json) =>
    _$ScoreEntryMetadataTaskImpl(
      associatedTaskId: json['task_id'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$ScoreEntryMetadataTaskImplToJson(
        _$ScoreEntryMetadataTaskImpl instance) =>
    <String, dynamic>{
      'task_id': instance.associatedTaskId,
      'type': instance.$type,
    };
