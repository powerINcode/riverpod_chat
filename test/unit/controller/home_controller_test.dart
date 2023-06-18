import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/ui/home_controller.dart';
import 'package:idt_chat/features/home/ui/home_state.dart';
import 'package:mocktail/mocktail.dart';

import '../use_case/mocks.dart';

void main() {
  late HomeController controller;
  late GetChatsUseCaseMock getChatsUseCaseMock;
  late LastMessageStateNotificationMock lastMessageStateNotification;

  setUp(() {
    getChatsUseCaseMock = GetChatsUseCaseMock();
    lastMessageStateNotification = LastMessageStateNotificationMock();

    controller = HomeController(
      getChatsUseCase: getChatsUseCaseMock,
      lastMessageStateNotification: lastMessageStateNotification,
    );
  });

  test('When load chats THEN emit state with chats', () async {
    // arrange
    const model = ChatModel(
      id: '1',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    when(() => getChatsUseCaseMock()).thenAnswer(
      (_) => Stream.value(const AsyncValue.data([model])),
    );

    // act
    controller.loadChats();

    // assert
    expectLater(
      controller.stream,
      emitsInOrder(
        [
          emits(
            const HomeState(
              chats: AsyncValue<List<ChatModel>>.data(
                [model],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
