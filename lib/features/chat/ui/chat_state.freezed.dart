// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatState {
  int get chatId => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  AsyncValue<ChatModel> get chat => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  AsyncValue<List<MessageModel>> get messages =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {int chatId,
      String topic,
      AsyncValue<ChatModel> chat,
      String userName,
      AsyncValue<List<MessageModel>> messages});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? topic = null,
    Object? chat = null,
    Object? userName = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ChatModel>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MessageModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_ChatStateCopyWith(
          _$_ChatState value, $Res Function(_$_ChatState) then) =
      __$$_ChatStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int chatId,
      String topic,
      AsyncValue<ChatModel> chat,
      String userName,
      AsyncValue<List<MessageModel>> messages});
}

/// @nodoc
class __$$_ChatStateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_ChatState>
    implements _$$_ChatStateCopyWith<$Res> {
  __$$_ChatStateCopyWithImpl(
      _$_ChatState _value, $Res Function(_$_ChatState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? topic = null,
    Object? chat = null,
    Object? userName = null,
    Object? messages = null,
  }) {
    return _then(_$_ChatState(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as int,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as AsyncValue<ChatModel>,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MessageModel>>,
    ));
  }
}

/// @nodoc

class _$_ChatState implements _ChatState {
  const _$_ChatState(
      {required this.chatId,
      this.topic = '',
      this.chat = const AsyncValue.loading(),
      required this.userName,
      this.messages = const AsyncValue.loading()});

  @override
  final int chatId;
  @override
  @JsonKey()
  final String topic;
  @override
  @JsonKey()
  final AsyncValue<ChatModel> chat;
  @override
  final String userName;
  @override
  @JsonKey()
  final AsyncValue<List<MessageModel>> messages;

  @override
  String toString() {
    return 'ChatState(chatId: $chatId, topic: $topic, chat: $chat, userName: $userName, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatState &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.chat, chat) || other.chat == chat) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, chatId, topic, chat, userName, messages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      __$$_ChatStateCopyWithImpl<_$_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {required final int chatId,
      final String topic,
      final AsyncValue<ChatModel> chat,
      required final String userName,
      final AsyncValue<List<MessageModel>> messages}) = _$_ChatState;

  @override
  int get chatId;
  @override
  String get topic;
  @override
  AsyncValue<ChatModel> get chat;
  @override
  String get userName;
  @override
  AsyncValue<List<MessageModel>> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatStateCopyWith<_$_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
