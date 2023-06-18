
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';

@freezed
class ChatModel with _$ChatModel {

  const factory  ChatModel({
    required String id,
    required String? lastMessage,
    required List<String> members,
    required String topic,
    required int? modifiedAt,
  }) = _ChatModel;

}
