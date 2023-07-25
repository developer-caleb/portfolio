// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResultDto _$ResultDtoFromJson(Map<String, dynamic> json) {
  return _ResultDto.fromJson(json);
}

/// @nodoc
mixin _$ResultDto {
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDtoCopyWith<ResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDtoCopyWith<$Res> {
  factory $ResultDtoCopyWith(ResultDto value, $Res Function(ResultDto) then) =
      _$ResultDtoCopyWithImpl<$Res>;
  $Res call({String? code, String? message});
}

/// @nodoc
class _$ResultDtoCopyWithImpl<$Res> implements $ResultDtoCopyWith<$Res> {
  _$ResultDtoCopyWithImpl(this._value, this._then);

  final ResultDto _value;
  // ignore: unused_field
  final $Res Function(ResultDto) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResultDtoCopyWith<$Res> implements $ResultDtoCopyWith<$Res> {
  factory _$$_ResultDtoCopyWith(
          _$_ResultDto value, $Res Function(_$_ResultDto) then) =
      __$$_ResultDtoCopyWithImpl<$Res>;
  @override
  $Res call({String? code, String? message});
}

/// @nodoc
class __$$_ResultDtoCopyWithImpl<$Res> extends _$ResultDtoCopyWithImpl<$Res>
    implements _$$_ResultDtoCopyWith<$Res> {
  __$$_ResultDtoCopyWithImpl(
      _$_ResultDto _value, $Res Function(_$_ResultDto) _then)
      : super(_value, (v) => _then(v as _$_ResultDto));

  @override
  _$_ResultDto get _value => super._value as _$_ResultDto;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ResultDto(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultDto implements _ResultDto {
  const _$_ResultDto({required this.code, required this.message});

  factory _$_ResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_ResultDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  @override
  String toString() {
    return 'ResultDto(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultDto &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ResultDtoCopyWith<_$_ResultDto> get copyWith =>
      __$$_ResultDtoCopyWithImpl<_$_ResultDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultDtoToJson(this);
  }
}

abstract class _ResultDto implements ResultDto {
  const factory _ResultDto(
      {required final String? code,
      required final String? message}) = _$_ResultDto;

  factory _ResultDto.fromJson(Map<String, dynamic> json) =
      _$_ResultDto.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ResultDtoCopyWith<_$_ResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
