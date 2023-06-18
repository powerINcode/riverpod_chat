import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/domain/use_case/observe_chat_messages.dart';
import 'package:idt_chat/features/chat/domain/use_case/post_chat_message.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chat_use_case.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chats_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../repository/mocks.dart';

void main() {
  late GetChatUseCase getChatUseCase;
  late GetChatsUseCase getChatsUseCase;
  late ObserveChatMessagesUseCase observeChatMessagesUseCase;
  late PostChatMessageUseCase postChatMessageUseCase;

  late ChatRepositoryMock chatRepositoryMock;
  late ChatMessagesRepositoryMock chatMessagesRepositoryMock;
  late UserRepositoryMock userRepositoryMock;

  setUp(() {
    chatRepositoryMock = ChatRepositoryMock();
    chatMessagesRepositoryMock = ChatMessagesRepositoryMock();
    userRepositoryMock = UserRepositoryMock();

    getChatUseCase = GetChatUseCase(chatsRepository: chatRepositoryMock);
    getChatsUseCase = GetChatsUseCase(chatsRepository: chatRepositoryMock);
    observeChatMessagesUseCase = ObserveChatMessagesUseCase(
      chatMessagesRepository: chatMessagesRepositoryMock,
    );
    postChatMessageUseCase = PostChatMessageUseCase(
      chatMessagesRepository: chatMessagesRepositoryMock,
      userRepository: userRepositoryMock,
    );
  });

  test('When get chats THEN return the list of the chats', () async {
    // arrange
    const model = ChatModel(
      id: 'id',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    when(() => chatRepositoryMock.getChats())
        .thenAnswer((_) async => const [model]);
    // assert
    expectLater(
        getChatsUseCase(),
        emitsInOrder([
          emits(const AsyncValue<List<ChatModel>>.loading()),
          emits(const AsyncValue<List<ChatModel>>.data([model]))
        ]));
  });

  test('When get chats by id THEN return the chat', () async {
    // arrange
    const model = ChatModel(
      id: 'id',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    when(() => chatRepositoryMock.getChat(model.id))
        .thenAnswer((_) async => model);

    // assert
    expectLater(
        getChatUseCase(model.id),
        emitsInOrder([
          emits(const AsyncValue<ChatModel>.loading()),
          emits(const AsyncValue<ChatModel>.data(model))
        ]));
  });

  test('When observe message THEN return the list of the models', () {
    // arrange
    const model = MessageModel(
        id: '1', message: 'message', modifiedAt: 0, sender: 'sender');

    when(() => chatMessagesRepositoryMock.observeChatMessages(
            chatId: any(named: 'chatId')))
        .thenAnswer((_) => Stream.value(const [model]));

    // assert
    expectLater(
      observeChatMessagesUseCase(chatId: 1),
      emitsInOrder(
        [
          emits(const AsyncValue<List<MessageModel>>.loading()),
          emits(const AsyncValue<List<MessageModel>>.data([model]))
        ],
      ),
    );
  });

  test('When post message THEN observe the list of the models', () async {
    // arrange
    const name = 'name';
    const model =
        MessageModel(id: '1', message: 'message', modifiedAt: 0, sender: name);

    when(() => chatMessagesRepositoryMock.observeChatMessages(
            chatId: any(named: 'chatId')))
        .thenAnswer((_) => Stream.value(const [model]));

    when(() => userRepositoryMock.getName()).thenAnswer((_) async => name);

    when(() => chatMessagesRepositoryMock.postMessage(
          chatId: any(named: 'chatId'),
          message: any(named: 'message'),
          sender: any(named: 'sender'),
          time: any(named: 'time'),
        )).thenAnswer((_) => Future.value());

    when(() => userRepositoryMock.getName()).thenAnswer((_) async => name);

    // act
    await postChatMessageUseCase(
        chatId: 1,
        message: model.message,
        sender: model.sender,
        time: model.modifiedAt);

    // assert
    expectLater(
      observeChatMessagesUseCase(chatId: 1),
      emitsInOrder(
        [
          emits(const AsyncValue<List<MessageModel>>.loading()),
          emits(const AsyncValue<List<MessageModel>>.data([model]))
        ],
      ),
    );
  });
}
