// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatDto _$ChatDtoFromJson(Map<String, dynamic> json) {
  return _ChatDto.fromJson(json);
}

/// @nodoc
mixin _$ChatDto {
  String get id => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  int? get modifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDtoCopyWith<ChatDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDtoCopyWith<$Res> {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) then) =
      _$ChatDtoCopyWithImpl<$Res, ChatDto>;
  @useResult
  $Res call(
      {String id,
      String? lastMessage,
      List<String> members,
      String topic,
      int? modifiedAt});
}

/// @nodoc
class _$ChatDtoCopyWithImpl<$Res, $Val extends ChatDto>
    implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastMessage = freezed,
    Object? members = null,
    Object? topic = null,
    Object? modifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatDtoCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$$_ChatDtoCopyWith(
          _$_ChatDto value, $Res Function(_$_ChatDto) then) =
      __$$_ChatDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? lastMessage,
      List<String> members,
      String topic,
      int? modifiedAt});
}

/// @nodoc
class __$$_ChatDtoCopyWithImpl<$Res>
    extends _$ChatDtoCopyWithImpl<$Res, _$_ChatDto>
    implements _$$_ChatDtoCopyWith<$Res> {
  __$$_ChatDtoCopyWithImpl(_$_ChatDto _value, $Res Function(_$_ChatDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastMessage = freezed,
    Object? members = null,
    Object? topic = null,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$_ChatDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatDto implements _ChatDto {
  const _$_ChatDto(
      {required this.id,
      required this.lastMessage,
      required final List<String> members,
      required this.topic,
      required this.modifiedAt})
      : _members = members;

  factory _$_ChatDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatDtoFromJson(json);

  @override
  final String id;
  @override
  final String? lastMessage;
  final List<String> _members;
  @override
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final String topic;
  @override
  final int? modifiedAt;

  @override
  String toString() {
    return 'ChatDto(id: $id, lastMessage: $lastMessage, members: $members, topic: $topic, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, lastMessage,
      const DeepCollectionEquality().hash(_members), topic, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatDtoCopyWith<_$_ChatDto> get copyWith =>
      __$$_ChatDtoCopyWithImpl<_$_ChatDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatDtoToJson(
      this,
    );
  }
}

abstract class _ChatDto implements ChatDto {
  const factory _ChatDto(
      {required final String id,
      required final String? lastMessage,
      required final List<String> members,
      required final String topic,
      required final int? modifiedAt}) = _$_ChatDto;

  factory _ChatDto.fromJson(Map<String, dynamic> json) = _$_ChatDto.fromJson;

  @override
  String get id;
  @override
  String? get lastMessage;
  @override
  List<String> get members;
  @override
  String get topic;
  @override
  int? get modifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatDtoCopyWith<_$_ChatDto> get copyWith =>
      throw _privateConstructorUsedError;
}
