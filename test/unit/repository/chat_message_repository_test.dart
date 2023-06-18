import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/core/data/network_client.dart';
import 'package:idt_chat/features/chat/data/dto/message_dto.dart';
import 'package:idt_chat/features/chat/data/repository/chat_messages_repository_impl.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late ChatMessagesRepositoryImpl repository;
  late ApiService apiService;

  setUp(() {
    apiService = ApiServiceMock();

    repository = ChatMessagesRepositoryImpl(api: apiService);
  });

  test('When observe message THEN return the list of the models', () {
    // arrange  
    const dto = MessageDto(
        id: 'id', message: 'message', modifiedAt: 0, sender: 'sender');

    const model = MessageModel(
        id: 'id', message: 'message', modifiedAt: 0, sender: 'sender');

    when(() => apiService.getChatMessages(any()))
        .thenAnswer((_) async => [dto]);

    // assert
    expectLater(
      repository.observeChatMessages(chatId: 1),
      emitsInOrder(
        [
          emits([model]),
        ],
      ),
    );
  });

  test('When post message THEN observe the list of the models', () async {
      // arrange
    const model = MessageModel(
        id: '1', message: 'message', modifiedAt: 0, sender: 'sender');

    when(() => apiService.getChatMessages(any())).thenAnswer((_) async => []);

    // act
    await repository.postMessage(
        chatId: 1, message: model.message, sender: model.sender, time: model.modifiedAt);

    // assert
    expectLater(
      repository.observeChatMessages(chatId: int.parse(model.id)),
      emitsInOrder(
        [
          emits([]),
          emits([model]),
        ],
      ),
    );
  });
}
