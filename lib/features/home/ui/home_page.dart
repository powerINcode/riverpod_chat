import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:idt_chat/core/extensions/go_router_extension.dart';
import 'package:idt_chat/features/chat/navigation/chat_navigation_config.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/providers/home_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(homeControllerStateNotifier.notifier).loadChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerStateNotifier.notifier);
    final state = ref.watch(homeControllerStateNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('chats').tr(),
      ),
      body: SafeArea(
          child: state.chats.when(
        data: (data) => _ChatsList(
          key: const ValueKey('ChatsList'),
          chats: data,
          onChatPressed: (chat) {
            GoRouter.of(context)
                .pushConfg(
                  ChatNavigationConfig.name,
                  ChatNavigationConfig(
                      chatId: int.parse(chat.id), topic: chat.topic),
                )
                .then((value) => controller.updateLastMessages());
          },
        ),
        error: (e, _) => _Error(onError: () async {
          await controller.loadChats();
        }),
        loading: () => const _Loading(),
      )),
    );
  }
}

class _ChatsList extends StatelessWidget {
  final List<ChatModel> chats;
  final ValueChanged<ChatModel> onChatPressed;

  const _ChatsList({
    super.key,
    required this.chats,
    required this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          final lastMessage = chat.lastMessage;

          return Card(
            child: ListTile(
              key: ValueKey(chat.id),
              title: Text(chat.topic),
              subtitle: lastMessage != null
                  ? Text(
                      lastMessage,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const SizedBox.shrink(),
              onTap: () => onChatPressed(chat),
            ),
          );
        },
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final VoidCallback onError;

  const _Error({
    super.key,
    required this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('error').tr(),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: onError,
            child: const Text('retry').tr(),
          )
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
