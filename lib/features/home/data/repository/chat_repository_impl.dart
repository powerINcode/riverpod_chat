import 'package:idt_chat/core/data/network_client.dart';
import 'package:idt_chat/features/home/data/dto/chat_dto.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ApiService _service;

  const ChatRepositoryImpl({
    required ApiService api,
  }) : _service = api;

  @override
  Future<List<ChatModel>> getChats() {
    return _service
        .getChats()
        .then((chats) => chats.map((chat) => chat.toDomain()).toList());
  }

  @override
  Future<ChatModel> getChat(String chatId) {
    return _service.getChats().then(
        (chats) => chats.firstWhere((chat) => chat.id == chatId).toDomain());
  }
}

extension on ChatDto {
  ChatModel toDomain() => ChatModel(
        id: id,
        lastMessage: lastMessage,
        members: members,
        topic: topic,
        modifiedAt: modifiedAt,
      );
}
