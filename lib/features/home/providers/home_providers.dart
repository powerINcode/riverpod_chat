import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/chat/providers/chat_providers.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chat_use_case.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chats_use_case.dart';
import 'package:idt_chat/features/home/ui/home_controller.dart';
import 'package:idt_chat/features/home/ui/home_state.dart';
import 'package:idt_chat/providers/providers.dart';

final getChatsStreamProvider = Provider((ref) {
  final repository = ref.watch(chatsRepositoryProvider);

  return GetChatsUseCase(chatsRepository: repository);
});

final getChatUseCaseProvider = Provider<GetChatUseCase>((ref) {
  final repository = ref.watch(chatsRepositoryProvider);

  return GetChatUseCase(chatsRepository: repository);
});

final homeControllerStateNotifier =
    StateNotifierProvider.autoDispose<HomeController, HomeState>((ref) {
  final getChatsUseCase = ref.watch(getChatsStreamProvider);
  final lastMessageStateNotification =
      ref.read(lastMessageStateNotificationProvider.notifier);

  return HomeController(
    getChatsUseCase: getChatsUseCase,
    lastMessageStateNotification: lastMessageStateNotification,
  );
});