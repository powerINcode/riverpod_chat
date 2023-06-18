import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/domain/repository/chat_repository.dart';

/// Fetch available chats
class GetChatUseCase {
  final ChatRepository _chatsRepository;

  const GetChatUseCase({required ChatRepository chatsRepository})
      : _chatsRepository = chatsRepository;

  Stream<AsyncValue<ChatModel>> call(String chatId) async* {
    yield const AsyncValue.loading();

    yield await _chatsRepository
        .getChat(chatId)
        .then((messages) => AsyncValue.data(messages))
        .catchError((e) => AsyncValue<ChatModel>.error(
              e,
              StackTrace.current,
            ));
  }
}
