import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/core/extensions/stream_extension.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/domain/use_case/observe_chat_messages.dart';
import 'package:idt_chat/features/chat/domain/use_case/post_chat_message.dart';
import 'package:idt_chat/features/chat/providers/last_message_provider.dart';
import 'package:idt_chat/features/chat/ui/chat_state.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chat_use_case.dart';
import 'package:idt_chat/features/user/domain/use_case/get_user_name_use_case.dart';
import 'package:rxdart/rxdart.dart';

class ChatController extends StateNotifier<ChatState> {
  final ObserveChatMessagesUseCase _observeChatMessagesUseCase;
  final PostChatMessageUseCase _postChatMessageUseCase;
  final GetUserNameUseCase _getUserNameUseCase;
  final GetChatUseCase _getChatUseCase;
  final LastMessageStateNotification _lastMessageStateNotification;

  final CompositeSubscription _composition = CompositeSubscription();

  ChatController({
    required ObserveChatMessagesUseCase observeChatMessagesUseCase,
    required PostChatMessageUseCase postChatMessageUseCase,
    required GetUserNameUseCase getUsernameUseCase,
    required LastMessageStateNotification lastMessageStateNotification,
    required GetChatUseCase getChatUseCase,
  })  : _observeChatMessagesUseCase = observeChatMessagesUseCase,
        _postChatMessageUseCase = postChatMessageUseCase,
        _getUserNameUseCase = getUsernameUseCase,
        _lastMessageStateNotification = lastMessageStateNotification,
        _getChatUseCase = getChatUseCase,
        super(
          const ChatState(
            chatId: 0,
            userName: '',
          ),
        );

  Future<void> observeMessages(int chatId, String topic) async {
    _composition.clear();

    CombineLatestStream([
      _observeChatMessagesUseCase(chatId: chatId),
      _getUserNameUseCase().asStream(),
      _getChatUseCase(chatId.toString()),
    ], (values) {
      final messages = values[0] as AsyncValue<List<MessageModel>>;
      final userName = values[1] as String;
      final chat = values[2] as AsyncValue<ChatModel>;

      state = state.copyWith(
        chatId: chatId,
        topic: topic,
        chat: chat,
        messages: messages,
        userName: userName,
      );
    }).subscribeIn(_composition);
  }

  Future<void> postMessage(String message) async {
    if (message.isEmpty) {
      return;
    }

    return _postChatMessageUseCase(chatId: state.chatId, message: message)
        .then(
          (value) => _lastMessageStateNotification.setLast(
            state.chatId.toString(),
            message,
          ),
        )
        // Emulate answer
        .then((_) => Future.delayed(const Duration(seconds: 2)))
        .then<String>((_) {
      if (!mounted) {
        return '';
      }
      if (!state.chat.hasValue) {
        return '';
      }

      final members = state.chat.requireValue.members.toList();
      final member = members[Random().nextInt(members.length)];

      final message = lorem(paragraphs: 1, words: 3);
      return _postChatMessageUseCase(
              chatId: state.chatId, message: message, sender: member)
          .then((_) => message);
    }).then(
      (message) {
        if (message.isEmpty) {
          return;
        }

        _lastMessageStateNotification.setLast(
          state.chatId.toString(),
          message,
        );
      },
    );
  }

  @override
  void dispose() {
    _composition.dispose();
    super.dispose();
  }
}
