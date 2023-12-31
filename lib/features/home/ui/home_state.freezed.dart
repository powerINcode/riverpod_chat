// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  AsyncValue<List<ChatModel>> get chats => throw _privateConstructorUsedError;
  Map<String, String> get lastMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {AsyncValue<List<ChatModel>> chats, Map<String, String> lastMessages});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? lastMessages = null,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ChatModel>>,
      lastMessages: null == lastMessages
          ? _value.lastMessages
          : lastMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<ChatModel>> chats, Map<String, String> lastMessages});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? lastMessages = null,
  }) {
    return _then(_$_HomeState(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ChatModel>>,
      lastMessages: null == lastMessages
          ? _value._lastMessages
          : lastMessages // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.chats, final Map<String, String> lastMessages = const {}})
      : _lastMessages = lastMessages;

  @override
  final AsyncValue<List<ChatModel>> chats;
  final Map<String, String> _lastMessages;
  @override
  @JsonKey()
  Map<String, String> get lastMessages {
    if (_lastMessages is EqualUnmodifiableMapView) return _lastMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastMessages);
  }

  @override
  String toString() {
    return 'HomeState(chats: $chats, lastMessages: $lastMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.chats, chats) || other.chats == chats) &&
            const DeepCollectionEquality()
                .equals(other._lastMessages, _lastMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chats, const DeepCollectionEquality().hash(_lastMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final AsyncValue<List<ChatModel>> chats,
      final Map<String, String> lastMessages}) = _$_HomeState;

  @override
  AsyncValue<List<ChatModel>> get chats;
  @override
  Map<String, String> get lastMessages;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
