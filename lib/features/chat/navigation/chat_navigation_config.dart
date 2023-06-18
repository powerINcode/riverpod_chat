import 'package:idt_chat/core/navigation/navigation_config.dart';

class ChatNavigationConfig extends NavigationConfig<String> {
  static const name = 'chat';
  final int chatId;
  final String topic;

  const ChatNavigationConfig({
    required this.chatId,
    required this.topic,
  });
}
