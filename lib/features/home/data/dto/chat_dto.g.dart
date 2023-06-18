// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatDto _$$_ChatDtoFromJson(Map<String, dynamic> json) => _$_ChatDto(
      id: json['id'] as String,
      lastMessage: json['lastMessage'] as String?,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
      topic: json['topic'] as String,
      modifiedAt: json['modifiedAt'] as int?,
    );

Map<String, dynamic> _$$_ChatDtoToJson(_$_ChatDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastMessage': instance.lastMessage,
      'members': instance.members,
      'topic': instance.topic,
      'modifiedAt': instance.modifiedAt,
    };
