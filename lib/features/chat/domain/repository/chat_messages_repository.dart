import 'package:idt_chat/features/chat/domain/model/message_model.dart';

abstract class ChatMessagesRepository {
  /// Fetch list of chat messages
  Stream<List<MessageModel>> observeChatMessages({
    required int chatId,
  });

  /// Post message into chat
  Future<void> postMessage({
    required int chatId,
    required String message,
    required String sender,
    int? time,
  });
}
