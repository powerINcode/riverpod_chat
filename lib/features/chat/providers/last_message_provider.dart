import 'package:flutter_riverpod/flutter_riverpod.dart';

class LastMessageStateNotification extends StateNotifier<Map<String, String>> {
  LastMessageStateNotification() : super({});

  void setLast(String id, String message) {
    final old = state;
    old[id] = message;
    state = old;
  }

  String? getLastMessage(String chatId) {
    return state[chatId];
  }
}
