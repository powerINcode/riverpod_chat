import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idt_chat/features/home/domain/model/chat_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required AsyncValue<List<ChatModel>> chats,
    @Default({}) Map<String, String> lastMessages,
  }) = _HomeState;
}
