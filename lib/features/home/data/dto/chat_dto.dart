
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_dto.freezed.dart';
part 'chat_dto.g.dart';

@freezed
class ChatDto with _$ChatDto {

  const factory  ChatDto({
    required String id,
    required String? lastMessage,
    required List<String> members,
    required String topic,
    required int? modifiedAt,
  }) = _ChatDto;

  factory ChatDto.fromJson(Map<String, Object?> json)
      => _$ChatDtoFromJson(json);

}
