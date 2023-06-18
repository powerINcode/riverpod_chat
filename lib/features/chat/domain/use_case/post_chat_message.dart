import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/chat/domain/repository/chat_messages_repository.dart';
import 'package:idt_chat/features/user/domain/repository/user_repository.dart';

/// Post chat message
class PostChatMessageUseCase {
  final UserRepository _userRepository;
  final ChatMessagesRepository _chatMessagesRepository;

  const PostChatMessageUseCase({
    required ChatMessagesRepository chatMessagesRepository,
    required UserRepository userRepository,
  })  : _chatMessagesRepository = chatMessagesRepository,
        _userRepository = userRepository;

  Future<AsyncValue<void>> call({
    required int chatId,
    required String message,
    String? sender,
    int? time,
  }) async {
    final userName = await _userRepository.getName();

    return _chatMessagesRepository
        .postMessage(
          chatId: chatId,
          message: message,
          sender: sender ?? userName,
          time: time 
        )
        .then((messages) => const AsyncValue<void>.data(null))
        .catchError(
          (e) => AsyncValue<void>.error(
            e,
            StackTrace.current,
          ),
        );
  }
}
