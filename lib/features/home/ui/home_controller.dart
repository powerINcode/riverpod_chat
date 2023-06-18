import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/core/extensions/stream_extension.dart';
import 'package:idt_chat/features/chat/providers/last_message_provider.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chats_use_case.dart';
import 'package:idt_chat/features/home/ui/home_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeController extends StateNotifier<HomeState> {
  final GetChatsUseCase _getChatsUseCase;
  final LastMessageStateNotification _lastMessageStateNotification;

  final CompositeSubscription _composition = CompositeSubscription();

  HomeController({
    required GetChatsUseCase getChatsUseCase,
    required LastMessageStateNotification lastMessageStateNotification,
  })  : _getChatsUseCase = getChatsUseCase,
        _lastMessageStateNotification = lastMessageStateNotification,
        super(const HomeState(chats: AsyncValue.loading()));

  Future<void> loadChats() async {
    _getChatsUseCase()
        .map((chats) => state = state.copyWith(chats: chats))
        .subscribeIn(_composition);
  }

  @override
  void dispose() {
    _composition.dispose();
    super.dispose();
  }

  Future<void> updateLastMessages() async {
    if (!state.chats.hasValue) {
      return;
    }
    final chats = state.chats.requireValue
        .map((chat) => chat.copyWith(
            lastMessage: _lastMessageStateNotification.getLastMessage(chat.id)))
        .toList();

    state = state.copyWith(chats: AsyncValue.data(chats));
  }
}
