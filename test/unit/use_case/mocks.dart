import 'package:idt_chat/features/chat/domain/use_case/observe_chat_messages.dart';
import 'package:idt_chat/features/chat/domain/use_case/post_chat_message.dart';
import 'package:idt_chat/features/chat/providers/last_message_provider.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chat_use_case.dart';
import 'package:idt_chat/features/home/domain/use_case/get_chats_use_case.dart';
import 'package:idt_chat/features/user/domain/use_case/get_user_name_use_case.dart';
import 'package:mocktail/mocktail.dart';

class GetChatUseCaseMock extends Mock implements GetChatUseCase {}

class GetChatsUseCaseMock extends Mock implements GetChatsUseCase {}

class ObserveChatMessagesUseCaseMock extends Mock
    implements ObserveChatMessagesUseCase {}

class PostChatMessageUseCaseMock extends Mock
    implements PostChatMessageUseCase {}

class GetUserNameUseCaseMock extends Mock implements GetUserNameUseCase {}

class LastMessageStateNotificationMock extends Mock
    implements LastMessageStateNotification {}
