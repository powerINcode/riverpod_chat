import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required int chatId,
    @Default('') String topic,
    @Default(AsyncValue.loading()) AsyncValue<ChatModel> chat,
    required String userName,
    @Default(AsyncValue.loading()) AsyncValue<List<MessageModel>> messages,
  }) = _ChatState;
}
