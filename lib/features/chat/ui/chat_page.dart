import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idt_chat/features/chat/domain/model/message_model.dart';
import 'package:idt_chat/features/chat/providers/chat_providers.dart';

class ChatPage extends ConsumerStatefulWidget {
  final int chatId;
  final String topic;

  const ChatPage({
    required this.chatId,
    required this.topic,
  }): super(key: const Key('ChatPage'));

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  void initState() {
    ref
        .read(chatControllerStateNotifier.notifier)
        .observeMessages(widget.chatId, widget.topic);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ChatPage oldWidget) {
    if (oldWidget.chatId != widget.chatId) {
      ref.read(chatControllerStateNotifier.notifier).observeMessages(
            widget.chatId,
            widget.topic,
          );
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chatControllerStateNotifier.notifier);
    final state = ref.watch(chatControllerStateNotifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.topic),
      ),
      body: SafeArea(
          child: state.messages.when(
        data: (data) => _Chat(
          messages: data,
          userName: state.userName,
          onPostMessage: (message) {
            controller.postMessage(message);
          },
        ),
        error: (e, _) => _Error(onError: () async {
          await controller.observeMessages(
            widget.chatId,
            widget.topic,
          );
        }),
        loading: () => const _Loading(),
      )),
    );
  }
}

class _Chat extends ConsumerStatefulWidget {
  final String userName;
  final List<MessageModel> messages;
  final ValueChanged<String> onPostMessage;

  const _Chat({
    super.key,
    required this.userName,
    required this.messages,
    required this.onPostMessage,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatState();
}

class _ChatState extends ConsumerState<_Chat> {
  final TextEditingController _controller = TextEditingController();

  @override
  void didUpdateWidget(covariant _Chat oldWidget) {
    if (oldWidget.messages != widget.messages) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final messages = widget.messages;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          widget.messages.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];

                    return _ChatMessage(
                      key: Key(message.id),
                      message: message,
                      isCurrentUser: message.sender == widget.userName,
                    );
                  },
                ))
              : Center(
                  child: const Text('empty_messages').tr(),
                ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'write_message'.tr(),
                      hintStyle: const TextStyle(color: Colors.black54),
                    ),
                    onSubmitted: (value) {
                      _postMessage(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                    onPressed: () => _postMessage(context), child: const Text('send').tr())
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _postMessage(BuildContext context) {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    widget.onPostMessage(_controller.text);
    _controller.clear();
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

class _ChatMessage extends StatelessWidget {
  final MessageModel message;
  final bool isCurrentUser;

  const _ChatMessage({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: isCurrentUser ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (isCurrentUser ? Colors.grey.shade200 : Colors.blue[200]),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            message.message,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
