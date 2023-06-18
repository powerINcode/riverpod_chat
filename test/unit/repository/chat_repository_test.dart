import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/core/data/network_client.dart';
import 'package:idt_chat/features/home/data/dto/chat_dto.dart';
import 'package:idt_chat/features/home/data/repository/chat_repository_impl.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

void main() {
  late ChatRepositoryImpl repository;
  late ApiService apiService;

  setUp(() {
    apiService = ApiServiceMock();

    repository = ChatRepositoryImpl(api: apiService);
  });

  test('When get chats THEN return the list of the chats', () async {
      // arrange
    const dto = ChatDto(
      id: 'id',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    const model = ChatModel(
      id: 'id',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    when(() => apiService.getChats()).thenAnswer((_) async => [dto]);

    // act
    final chats = await repository.getChats();

    // assert
    expect(chats, [model]);
  });

  test('When get chats by id THEN return the chat', () async {
    // arrange
    const dto = ChatDto(
      id: 'id',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    const model = ChatModel(
      id: 'id',
      lastMessage: 'lastMessage',
      members: [],
      topic: 'topic',
      modifiedAt: 0,
    );

    when(() => apiService.getChats()).thenAnswer((_) async => [dto]);

    // act
    final chat = await repository.getChat(dto.id);

    // assert
    expect(chat, model);
  });
}
