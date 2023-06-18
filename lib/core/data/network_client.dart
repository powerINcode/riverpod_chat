import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:idt_chat/features/chat/data/dto/message_dto.dart';
import 'package:idt_chat/features/home/data/dto/chat_dto.dart';
import 'package:logger/logger.dart';

/// Note
/// I used the local json files instead of loading from the URL
/// because json files contain an error and can't be properly parsed
class ApiService {
  static const _baseUrl = 'assets/json';
  final Logger _logger;

  const ApiService({required Logger logger}) : _logger = logger;

  Future<List<ChatDto>> getChats() async {
    // Immitation of API call
    await Future.delayed(const Duration(seconds: 1));
    try {
      final input = await rootBundle.loadString('$_baseUrl/chats.json');
      final list = jsonDecode(input) as List<dynamic>;

      return list.map((json) => ChatDto.fromJson(json)).toList();
    } catch (e) {
      _logger.e('Unable to read chats.json file: $e');
      return [];
    }
  }

  Future<List<MessageDto>> getChatMessages(int chatId) async {
    // Immitation of API call
    await Future.delayed(const Duration(seconds: 1));
    try {
      final input = await rootBundle.loadString('$_baseUrl/chat_$chatId.json');
      final list = jsonDecode(input) as List<dynamic>;

      return list.map((json) => MessageDto.fromJson(json)).toList();
    } catch (e) {
      _logger.e('Unable to read chat_$chatId.json file: $e');
      return [];
    }
  }
}
