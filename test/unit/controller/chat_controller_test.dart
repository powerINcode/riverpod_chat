import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/ui/chat_controller.dart';
import 'package:idt_chat/features/chat/ui/chat_state.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fake_async/fake_async.dart';

import '../use_case/mocks.dart';

void main() {
  late ChatController controller;
  late ObserveChatMessagesUseCaseMock observeChatMessagesUseCase;
  late PostChatMessageUseCaseMock postChatMessageUseCase;
  late GetUserNameUseCaseMock getUserNameUseCase;
  late GetChatUseCaseMock getChatUseCase;
  late LastMessageStateNotificationMock lastMessageStateNotificationMock;

  setUp(() {
    observeChatMessagesUseCase = ObserveChatMessagesUseCaseMock();
    postChatMessageUseCase = PostChatMessageUseCaseMock();
    getUserNameUseCase = GetUserNameUseCaseMock();
    getChatUseCase = GetChatUseCaseMock();
    lastMessageStateNotificationMock = LastMessageStateNotificationMock();

    controller = ChatController(
      observeChatMessagesUseCase: observeChatMessagesUseCase,
      postChatMessageUseCase: postChatMessageUseCase,
      getUsernameUseCase: getUserNameUseCase,
      getChatUseCase: getChatUseCase,
      lastMessageStateNotification: lastMessageStateNotificationMock,
    );
  });

  test('When load chats THEN emit state with chats', () {
    fakeAsync((async) {
      // arrange
      const model = MessageModel(
        id: '1',
        message: 'message',
        modifiedAt: 0,
        sender: 'sender',
      );
      const chat = ChatModel(
        id: '1',
        lastMessage: 'lastMessage',
        members: [],
        topic: 'topic',
        modifiedAt: 0,
      );

      when(() => observeChatMessagesUseCase(chatId: any(named: 'chatId')))
          .thenAnswer((_) =>
              Stream.value(const AsyncValue<List<MessageModel>>.data([model])));
      when(() => getUserNameUseCase())
          .thenAnswer((_) => Future.value(model.sender));
      when(() => getChatUseCase(any())).thenAnswer(
          (_) => Stream.value(const AsyncValue<ChatModel>.data(chat)));

      // act
      controller.observeMessages(int.parse(chat.id), chat.topic);

      // assert
      expectLater(
          controller.stream,
          emitsInOrder([
            emits(ChatState(
              chatId: int.parse(chat.id),
              userName: model.sender,
              topic: chat.topic,
              chat: const AsyncValue<ChatModel>.data(chat),
              messages: const AsyncValue<List<MessageModel>>.data(
                [model],
              ),
            ))
          ]));

      async.elapse(const Duration(seconds: 5));
    });
  });
}
