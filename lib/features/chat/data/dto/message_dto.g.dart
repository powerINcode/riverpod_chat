// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDto _$$_MessageDtoFromJson(Map<String, dynamic> json) =>
    _$_MessageDto(
      id: json['id'] as String,
      message: json['message'] as String,
      modifiedAt: json['modifiedAt'] as int?,
      sender: json['sender'] as String,
    );

Map<String, dynamic> _$$_MessageDtoToJson(_$_MessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'modifiedAt': instance.modifiedAt,
      'sender': instance.sender,
    };
