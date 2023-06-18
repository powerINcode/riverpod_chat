import 'package:idt_chat/features/home/domain/model/chat_model.dart';

abstract class ChatRepository {
  /// Fetch list of avaulable chats
  Future<List<ChatModel>> getChats();

  /// Fetch chat by id
  Future<ChatModel> getChat(String chatId);
}
