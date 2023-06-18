import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/domain/repository/chat_repository.dart';

/// Fetch available chats
class GetChatsUseCase {
  final ChatRepository _chatsRepository;

  const GetChatsUseCase({required ChatRepository chatsRepository})
      : _chatsRepository = chatsRepository;

  Stream<AsyncValue<List<ChatModel>>> call() async* {
    yield const AsyncValue.loading();

    yield await _chatsRepository
        .getChats()
        .then((messages) => AsyncValue.data(messages))
        .catchError((e) => AsyncValue<List<ChatModel>>.error(
              e,
              StackTrace.current,
            ));
  }
}
