import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
class MessageDto with _$MessageDto {

  const factory MessageDto({
    required String id,
    required String message,
    required int? modifiedAt,
    required String sender,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, Object?> json)
      => _$MessageDtoFromJson(json);
}
