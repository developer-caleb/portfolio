// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModelDto _$UserModelDtoFromJson(Map<String, dynamic> json) {
  return _UserModelDto.fromJson(json);
}

/// @nodoc
mixin _$UserModelDto {
  String? get userNickname => throw _privateConstructorUsedError;
  String? get userProfileImgUrl => throw _privateConstructorUsedError;
  String? get grantType => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelDtoCopyWith<UserModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelDtoCopyWith<$Res> {
  factory $UserModelDtoCopyWith(
          UserModelDto value, $Res Function(UserModelDto) then) =
      _$UserModelDtoCopyWithImpl<$Res>;
  $Res call(
      {String? userNickname,
      String? userProfileImgUrl,
      String? grantType,
      String? accessToken,
      String? refreshToken,
      int? userSeq});
}

/// @nodoc
class _$UserModelDtoCopyWithImpl<$Res> implements $UserModelDtoCopyWith<$Res> {
  _$UserModelDtoCopyWithImpl(this._value, this._then);

  final UserModelDto _value;
  // ignore: unused_field
  final $Res Function(UserModelDto) _then;

  @override
  $Res call({
    Object? userNickname = freezed,
    Object? userProfileImgUrl = freezed,
    Object? grantType = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_value.copyWith(
      userNickname: userNickname == freezed
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileImgUrl: userProfileImgUrl == freezed
          ? _value.userProfileImgUrl
          : userProfileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      grantType: grantType == freezed
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserModelDtoCopyWith<$Res>
    implements $UserModelDtoCopyWith<$Res> {
  factory _$$_UserModelDtoCopyWith(
          _$_UserModelDto value, $Res Function(_$_UserModelDto) then) =
      __$$_UserModelDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? userNickname,
      String? userProfileImgUrl,
      String? grantType,
      String? accessToken,
      String? refreshToken,
      int? userSeq});
}

/// @nodoc
class __$$_UserModelDtoCopyWithImpl<$Res>
    extends _$UserModelDtoCopyWithImpl<$Res>
    implements _$$_UserModelDtoCopyWith<$Res> {
  __$$_UserModelDtoCopyWithImpl(
      _$_UserModelDto _value, $Res Function(_$_UserModelDto) _then)
      : super(_value, (v) => _then(v as _$_UserModelDto));

  @override
  _$_UserModelDto get _value => super._value as _$_UserModelDto;

  @override
  $Res call({
    Object? userNickname = freezed,
    Object? userProfileImgUrl = freezed,
    Object? grantType = freezed,
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_$_UserModelDto(
      userNickname: userNickname == freezed
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileImgUrl: userProfileImgUrl == freezed
          ? _value.userProfileImgUrl
          : userProfileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      grantType: grantType == freezed
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModelDto implements _UserModelDto {
  _$_UserModelDto(
      {this.userNickname,
      this.userProfileImgUrl,
      this.grantType,
      this.accessToken,
      this.refreshToken,
      this.userSeq});

  factory _$_UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelDtoFromJson(json);

  @override
  final String? userNickname;
  @override
  final String? userProfileImgUrl;
  @override
  final String? grantType;
  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final int? userSeq;

  @override
  String toString() {
    return 'UserModelDto(userNickname: $userNickname, userProfileImgUrl: $userProfileImgUrl, grantType: $grantType, accessToken: $accessToken, refreshToken: $refreshToken, userSeq: $userSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModelDto &&
            const DeepCollectionEquality()
                .equals(other.userNickname, userNickname) &&
            const DeepCollectionEquality()
                .equals(other.userProfileImgUrl, userProfileImgUrl) &&
            const DeepCollectionEquality().equals(other.grantType, grantType) &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken) &&
            const DeepCollectionEquality().equals(other.userSeq, userSeq));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userNickname),
      const DeepCollectionEquality().hash(userProfileImgUrl),
      const DeepCollectionEquality().hash(grantType),
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken),
      const DeepCollectionEquality().hash(userSeq));

  @JsonKey(ignore: true)
  @override
  _$$_UserModelDtoCopyWith<_$_UserModelDto> get copyWith =>
      __$$_UserModelDtoCopyWithImpl<_$_UserModelDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelDtoToJson(this);
  }
}

abstract class _UserModelDto implements UserModelDto {
  factory _UserModelDto(
      {final String? userNickname,
      final String? userProfileImgUrl,
      final String? grantType,
      final String? accessToken,
      final String? refreshToken,
      final int? userSeq}) = _$_UserModelDto;

  factory _UserModelDto.fromJson(Map<String, dynamic> json) =
      _$_UserModelDto.fromJson;

  @override
  String? get userNickname => throw _privateConstructorUsedError;
  @override
  String? get userProfileImgUrl => throw _privateConstructorUsedError;
  @override
  String? get grantType => throw _privateConstructorUsedError;
  @override
  String? get accessToken => throw _privateConstructorUsedError;
  @override
  String? get refreshToken => throw _privateConstructorUsedError;
  @override
  int? get userSeq => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelDtoCopyWith<_$_UserModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}
