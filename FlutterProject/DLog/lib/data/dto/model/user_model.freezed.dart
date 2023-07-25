// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String? get userNickname => throw _privateConstructorUsedError;
  String? get userProfileImgUrl => throw _privateConstructorUsedError;
  String? get authTypeCode => throw _privateConstructorUsedError;
  int? get userSeq => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String uid,
      String? userNickname,
      String? userProfileImgUrl,
      String? authTypeCode,
      int? userSeq});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? userNickname = freezed,
    Object? userProfileImgUrl = freezed,
    Object? authTypeCode = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userNickname: userNickname == freezed
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileImgUrl: userProfileImgUrl == freezed
          ? _value.userProfileImgUrl
          : userProfileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authTypeCode: authTypeCode == freezed
          ? _value.authTypeCode
          : authTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uid,
      String? userNickname,
      String? userProfileImgUrl,
      String? authTypeCode,
      int? userSeq});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, (v) => _then(v as _$_UserModel));

  @override
  _$_UserModel get _value => super._value as _$_UserModel;

  @override
  $Res call({
    Object? uid = freezed,
    Object? userNickname = freezed,
    Object? userProfileImgUrl = freezed,
    Object? authTypeCode = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_$_UserModel(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userNickname: userNickname == freezed
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileImgUrl: userProfileImgUrl == freezed
          ? _value.userProfileImgUrl
          : userProfileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authTypeCode: authTypeCode == freezed
          ? _value.authTypeCode
          : authTypeCode // ignore: cast_nullable_to_non_nullable
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
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {required this.uid,
      this.userNickname,
      this.userProfileImgUrl,
      this.authTypeCode,
      this.userSeq});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String uid;
  @override
  final String? userNickname;
  @override
  final String? userProfileImgUrl;
  @override
  final String? authTypeCode;
  @override
  final int? userSeq;

  @override
  String toString() {
    return 'UserModel(uid: $uid, userNickname: $userNickname, userProfileImgUrl: $userProfileImgUrl, authTypeCode: $authTypeCode, userSeq: $userSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.userNickname, userNickname) &&
            const DeepCollectionEquality()
                .equals(other.userProfileImgUrl, userProfileImgUrl) &&
            const DeepCollectionEquality()
                .equals(other.authTypeCode, authTypeCode) &&
            const DeepCollectionEquality().equals(other.userSeq, userSeq));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(userNickname),
      const DeepCollectionEquality().hash(userProfileImgUrl),
      const DeepCollectionEquality().hash(authTypeCode),
      const DeepCollectionEquality().hash(userSeq));

  @JsonKey(ignore: true)
  @override
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String uid,
      final String? userNickname,
      final String? userProfileImgUrl,
      final String? authTypeCode,
      final int? userSeq}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String? get userNickname => throw _privateConstructorUsedError;
  @override
  String? get userProfileImgUrl => throw _privateConstructorUsedError;
  @override
  String? get authTypeCode => throw _privateConstructorUsedError;
  @override
  int? get userSeq => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
