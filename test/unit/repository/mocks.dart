import 'package:idt_chat/core/data/network_client.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/domain/repository/chat_messages_repository.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/domain/repository/chat_repository.dart';
import 'package:idt_chat/features/user/domain/repository/user_repository.dart';
import 'package:mocktail/mocktail.dart';

class ChatModelMock extends Mock implements ChatModel {}

class MessageModelMock extends Mock implements MessageModel {}

class ApiServiceMock extends Mock
    implements ApiService {}

class ChatMessagesRepositoryMock extends Mock
    implements ChatMessagesRepository {}

class ChatRepositoryMock extends Mock implements ChatRepository {}

class UserRepositoryMock extends Mock implements UserRepository {}

