// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'delete_diary_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteDiaryReq _$DeleteDiaryReqFromJson(Map<String, dynamic> json) {
  return _DeleteDiaryReq.fromJson(json);
}

/// @nodoc
mixin _$DeleteDiaryReq {
  int get diarySeq => throw _privateConstructorUsedError;
  int get diaryVolumeSeq => throw _privateConstructorUsedError;
  int get userSeq => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteDiaryReqCopyWith<DeleteDiaryReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteDiaryReqCopyWith<$Res> {
  factory $DeleteDiaryReqCopyWith(
          DeleteDiaryReq value, $Res Function(DeleteDiaryReq) then) =
      _$DeleteDiaryReqCopyWithImpl<$Res>;
  $Res call({int diarySeq, int diaryVolumeSeq, int userSeq});
}

/// @nodoc
class _$DeleteDiaryReqCopyWithImpl<$Res>
    implements $DeleteDiaryReqCopyWith<$Res> {
  _$DeleteDiaryReqCopyWithImpl(this._value, this._then);

  final DeleteDiaryReq _value;
  // ignore: unused_field
  final $Res Function(DeleteDiaryReq) _then;

  @override
  $Res call({
    Object? diarySeq = freezed,
    Object? diaryVolumeSeq = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_value.copyWith(
      diarySeq: diarySeq == freezed
          ? _value.diarySeq
          : diarySeq // ignore: cast_nullable_to_non_nullable
              as int,
      diaryVolumeSeq: diaryVolumeSeq == freezed
          ? _value.diaryVolumeSeq
          : diaryVolumeSeq // ignore: cast_nullable_to_non_nullable
              as int,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DeleteDiaryReqCopyWith<$Res>
    implements $DeleteDiaryReqCopyWith<$Res> {
  factory _$$_DeleteDiaryReqCopyWith(
          _$_DeleteDiaryReq value, $Res Function(_$_DeleteDiaryReq) then) =
      __$$_DeleteDiaryReqCopyWithImpl<$Res>;
  @override
  $Res call({int diarySeq, int diaryVolumeSeq, int userSeq});
}

/// @nodoc
class __$$_DeleteDiaryReqCopyWithImpl<$Res>
    extends _$DeleteDiaryReqCopyWithImpl<$Res>
    implements _$$_DeleteDiaryReqCopyWith<$Res> {
  __$$_DeleteDiaryReqCopyWithImpl(
      _$_DeleteDiaryReq _value, $Res Function(_$_DeleteDiaryReq) _then)
      : super(_value, (v) => _then(v as _$_DeleteDiaryReq));

  @override
  _$_DeleteDiaryReq get _value => super._value as _$_DeleteDiaryReq;

  @override
  $Res call({
    Object? diarySeq = freezed,
    Object? diaryVolumeSeq = freezed,
    Object? userSeq = freezed,
  }) {
    return _then(_$_DeleteDiaryReq(
      diarySeq: diarySeq == freezed
          ? _value.diarySeq
          : diarySeq // ignore: cast_nullable_to_non_nullable
              as int,
      diaryVolumeSeq: diaryVolumeSeq == freezed
          ? _value.diaryVolumeSeq
          : diaryVolumeSeq // ignore: cast_nullable_to_non_nullable
              as int,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeleteDiaryReq implements _DeleteDiaryReq {
  const _$_DeleteDiaryReq(
      {required this.diarySeq,
      required this.diaryVolumeSeq,
      required this.userSeq});

  factory _$_DeleteDiaryReq.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteDiaryReqFromJson(json);

  @override
  final int diarySeq;
  @override
  final int diaryVolumeSeq;
  @override
  final int userSeq;

  @override
  String toString() {
    return 'DeleteDiaryReq(diarySeq: $diarySeq, diaryVolumeSeq: $diaryVolumeSeq, userSeq: $userSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteDiaryReq &&
            const DeepCollectionEquality().equals(other.diarySeq, diarySeq) &&
            const DeepCollectionEquality()
                .equals(other.diaryVolumeSeq, diaryVolumeSeq) &&
            const DeepCollectionEquality().equals(other.userSeq, userSeq));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diarySeq),
      const DeepCollectionEquality().hash(diaryVolumeSeq),
      const DeepCollectionEquality().hash(userSeq));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteDiaryReqCopyWith<_$_DeleteDiaryReq> get copyWith =>
      __$$_DeleteDiaryReqCopyWithImpl<_$_DeleteDiaryReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteDiaryReqToJson(this);
  }
}

abstract class _DeleteDiaryReq implements DeleteDiaryReq {
  const factory _DeleteDiaryReq(
      {required final int diarySeq,
      required final int diaryVolumeSeq,
      required final int userSeq}) = _$_DeleteDiaryReq;

  factory _DeleteDiaryReq.fromJson(Map<String, dynamic> json) =
      _$_DeleteDiaryReq.fromJson;

  @override
  int get diarySeq => throw _privateConstructorUsedError;
  @override
  int get diaryVolumeSeq => throw _privateConstructorUsedError;
  @override
  int get userSeq => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteDiaryReqCopyWith<_$_DeleteDiaryReq> get copyWith =>
      throw _privateConstructorUsedError;
}
