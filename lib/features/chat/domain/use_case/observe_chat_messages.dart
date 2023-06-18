import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/domain/repository/chat_messages_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Observe chat messages
class ObserveChatMessagesUseCase {
  final ChatMessagesRepository _chatMessagesRepository;

  const ObserveChatMessagesUseCase(
      {required ChatMessagesRepository chatMessagesRepository})
      : _chatMessagesRepository = chatMessagesRepository;

  Stream<AsyncValue<List<MessageModel>>> call({required int chatId}) async* {
    yield const AsyncValue.loading();
    yield* _chatMessagesRepository
        .observeChatMessages(chatId: chatId)
        .map((messages) => AsyncValue.data(messages))
        .onErrorReturnWith(
          (e, _) => AsyncValue<List<MessageModel>>.error(
            e,
            StackTrace.current,
          ),
        );
  }
}
