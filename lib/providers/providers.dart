import 'package:idt_chat/core/data/network_client.dart';
import 'package:idt_chat/features/chat/data/repository/chat_messages_repository_impl.dart';
import 'package:idt_chat/features/chat/domain/repository/chat_messages_repository.dart';
import 'package:idt_chat/features/home/data/repository/chat_repository_impl.dart';
import 'package:idt_chat/features/home/domain/repository/chat_repository.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loggerProvider = Provider((ref) => Logger(
      filter: null,
      printer: PrettyPrinter(),
      output: null,
    ));

final apiClientProvider = Provider((ref) {
  final logger = ref.watch(loggerProvider);

  return ApiService(logger: logger);
});

final chatsRepositoryProvider = Provider<ChatRepository>((ref) {
  final api = ref.watch(apiClientProvider);

  return ChatRepositoryImpl(api: api);
});

final chatMessagesRepositoryProvider = Provider<ChatMessagesRepository>((ref) {
  final api = ref.watch(apiClientProvider);

  return ChatMessagesRepositoryImpl(api: api);
});
