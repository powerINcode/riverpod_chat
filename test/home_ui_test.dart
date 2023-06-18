// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idt_chat/application.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';
import 'package:idt_chat/features/home/providers/home_providers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'unit/use_case/mocks.dart';

void main() {
  late GetChatsUseCaseMock getChatsUseCaseMock;

  setUp(() {
    getChatsUseCaseMock = GetChatsUseCaseMock();
  });

  testWidgets('Launch home and tap on the chat', (WidgetTester tester) async {
    // arrange
    SharedPreferences.setMockInitialValues({});
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    await tester.runAsync(() async {
      const chat = ChatModel(
        id: '1',
        lastMessage: 'lastMessage',
        members: [],
        topic: 'topic',
        modifiedAt: 0,
      );
      const chats = [chat];

      when(() => getChatsUseCaseMock()).thenAnswer(
        (_) => Stream.value(
          const AsyncValue<List<ChatModel>>.data(chats),
        ),
      );
      
      // act
      await tester.pumpWidget(EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: ProviderScope(
          overrides: [
            getChatsStreamProvider.overrideWithValue(getChatsUseCaseMock)
          ],
          child: const Application(),
        ),
      ));

    // assert
      await tester.pump();
      await tester.pump();

      expect(find.text(chat.topic), findsOneWidget);

      await tester.tap(find.text(chat.topic));
      await tester.pump();
      await tester.pump();
      expect(find.widgetWithText(AppBar, chat.topic), findsOneWidget);
    });
  });
}
