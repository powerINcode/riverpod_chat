import 'package:idt_chat/core/data/network_client.dart';
import 'package:idt_chat/features/chat/data/dto/message_dto.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/domain/repository/chat_messages_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChatMessagesRepositoryImpl implements ChatMessagesRepository {
  final ApiService _service;

  // We don't need to dispose it because it's app level lifecycle scope
  final BehaviorSubject<Map<int, List<MessageModel>>> _chatsMessagesSubject =
      BehaviorSubject.seeded({});

  ChatMessagesRepositoryImpl({
    required ApiService api,
  }) : _service = api;

  @override
  Stream<List<MessageModel>> observeChatMessages({required int chatId}) {
    return ConcatStream([
      _service
          .getChatMessages(chatId)
          .then(
            (messages) =>
                messages.map((message) => message.toDomain()).toList(),
          )
          .asStream()
          .doOnData(
        (messages) {
          final cache = _chatsMessagesSubject.value;
          final chatCache = (cache[chatId]?.toSet() ?? {});
          chatCache.addAll(messages);
          cache[chatId] = chatCache.toList();

          _chatsMessagesSubject.add(cache);
        },
      ),
      _chatsMessagesSubject.map((chats) => chats[chatId] ?? [])
    ]).distinctUnique();
  }

  @override
  Future<void> postMessage({
    required int chatId,
    required String message,
    required String sender,
    int? time,
  }) async {
    final messages = _chatsMessagesSubject.value[chatId]?.toList() ?? [];

    messages.add(
      MessageModel(
        id: chatId.toString(),
        message: message,
        modifiedAt: time ?? DateTime.now().microsecondsSinceEpoch,
        sender: sender,
      ),
    );

    _chatsMessagesSubject.value[chatId] = messages;

    _chatsMessagesSubject.add(_chatsMessagesSubject.value);
  }
}

extension on MessageDto {
  MessageModel toDomain() => MessageModel(
        id: id,
        message: message,
        modifiedAt: modifiedAt,
        sender: sender,
      );
}
