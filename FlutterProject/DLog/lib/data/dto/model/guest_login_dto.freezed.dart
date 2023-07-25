// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'guest_login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestLoginDto _$GuestLoginDtoFromJson(Map<String, dynamic> json) {
  return _GuestLoginDto.fromJson(json);
}

/// @nodoc
mixin _$GuestLoginDto {
  UserModelDto? get data => throw _privateConstructorUsedError;
  ResultDto? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestLoginDtoCopyWith<GuestLoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestLoginDtoCopyWith<$Res> {
  factory $GuestLoginDtoCopyWith(
          GuestLoginDto value, $Res Function(GuestLoginDto) then) =
      _$GuestLoginDtoCopyWithImpl<$Res>;
  $Res call({UserModelDto? data, ResultDto? result});

  $UserModelDtoCopyWith<$Res>? get data;
  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class _$GuestLoginDtoCopyWithImpl<$Res>
    implements $GuestLoginDtoCopyWith<$Res> {
  _$GuestLoginDtoCopyWithImpl(this._value, this._then);

  final GuestLoginDto _value;
  // ignore: unused_field
  final $Res Function(GuestLoginDto) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserModelDto?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
  }

  @override
  $UserModelDtoCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserModelDtoCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }

  @override
  $ResultDtoCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultDtoCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc
abstract class _$$_GuestLoginDtoCopyWith<$Res>
    implements $GuestLoginDtoCopyWith<$Res> {
  factory _$$_GuestLoginDtoCopyWith(
          _$_GuestLoginDto value, $Res Function(_$_GuestLoginDto) then) =
      __$$_GuestLoginDtoCopyWithImpl<$Res>;
  @override
  $Res call({UserModelDto? data, ResultDto? result});

  @override
  $UserModelDtoCopyWith<$Res>? get data;
  @override
  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_GuestLoginDtoCopyWithImpl<$Res>
    extends _$GuestLoginDtoCopyWithImpl<$Res>
    implements _$$_GuestLoginDtoCopyWith<$Res> {
  __$$_GuestLoginDtoCopyWithImpl(
      _$_GuestLoginDto _value, $Res Function(_$_GuestLoginDto) _then)
      : super(_value, (v) => _then(v as _$_GuestLoginDto));

  @override
  _$_GuestLoginDto get _value => super._value as _$_GuestLoginDto;

  @override
  $Res call({
    Object? data = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_GuestLoginDto(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserModelDto?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuestLoginDto implements _GuestLoginDto {
  const _$_GuestLoginDto({required this.data, required this.result});

  factory _$_GuestLoginDto.fromJson(Map<String, dynamic> json) =>
      _$$_GuestLoginDtoFromJson(json);

  @override
  final UserModelDto? data;
  @override
  final ResultDto? result;

  @override
  String toString() {
    return 'GuestLoginDto(data: $data, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuestLoginDto &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_GuestLoginDtoCopyWith<_$_GuestLoginDto> get copyWith =>
      __$$_GuestLoginDtoCopyWithImpl<_$_GuestLoginDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestLoginDtoToJson(this);
  }
}

abstract class _GuestLoginDto implements GuestLoginDto {
  const factory _GuestLoginDto(
      {required final UserModelDto? data,
      required final ResultDto? result}) = _$_GuestLoginDto;

  factory _GuestLoginDto.fromJson(Map<String, dynamic> json) =
      _$_GuestLoginDto.fromJson;

  @override
  UserModelDto? get data => throw _privateConstructorUsedError;
  @override
  ResultDto? get result => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GuestLoginDtoCopyWith<_$_GuestLoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}
