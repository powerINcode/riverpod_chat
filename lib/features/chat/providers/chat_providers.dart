import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/chat/domain/use_case/observe_chat_messages.dart';
import 'package:idt_chat/features/chat/domain/use_case/post_chat_message.dart';
import 'package:idt_chat/features/chat/providers/last_message_provider.dart';
import 'package:idt_chat/features/chat/ui/chat_controller.dart';
import 'package:idt_chat/features/chat/ui/chat_state.dart';
import 'package:idt_chat/features/home/providers/home_providers.dart';
import 'package:idt_chat/features/user/providers/user_providers.dart';
import 'package:idt_chat/providers/providers.dart';

final observeChatMessagesUseCase = Provider<ObserveChatMessagesUseCase>((ref) {
  final repository = ref.watch(chatMessagesRepositoryProvider);

  return ObserveChatMessagesUseCase(chatMessagesRepository: repository);
});

final postChatMessageUseCase = Provider<PostChatMessageUseCase>((ref) {
  final chatRepository = ref.watch(chatMessagesRepositoryProvider);
  final userRepository = ref.watch(userRepositoryProvider);

  return PostChatMessageUseCase(
    chatMessagesRepository: chatRepository,
    userRepository: userRepository,
  );
});

final lastMessageStateNotificationProvider =
    StateNotifierProvider<LastMessageStateNotification, Map<String, String>>(
        (ref) => LastMessageStateNotification());

final chatControllerStateNotifier =
    StateNotifierProvider.autoDispose<ChatController, ChatState>((ref) {
  final chatMessagesUseCase = ref.watch(observeChatMessagesUseCase);
  final postMessageUseCase = ref.watch(postChatMessageUseCase);
  final getNameUseCase = ref.watch(getUserNameUseCase);
  final getChatUseCase = ref.watch(getChatUseCaseProvider);
  final lastMessageState =
      ref.read(lastMessageStateNotificationProvider.notifier);

  return ChatController(
    observeChatMessagesUseCase: chatMessagesUseCase,
    postChatMessageUseCase: postMessageUseCase,
    getUsernameUseCase: getNameUseCase,
    getChatUseCase: getChatUseCase,
    lastMessageStateNotification: lastMessageState,
  );
});
