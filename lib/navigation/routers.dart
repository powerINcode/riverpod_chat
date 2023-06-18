import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:idt_chat/features/chat/navigation/chat_navigation_config.dart';
import 'package:idt_chat/features/chat/ui/chat_page.dart';
import 'package:idt_chat/features/home/ui/home_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: ChatNavigationConfig.name,
          name: ChatNavigationConfig.name,
          builder: (BuildContext context, GoRouterState state) {
            final config = state.extra as ChatNavigationConfig;

            return ChatPage(
              chatId: config.chatId,
              topic: config.topic,
            );
          },
        ),
      ],
    ),
  ],
);
