// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'common_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommonRes _$CommonResFromJson(Map<String, dynamic> json) {
  return _CommonRes.fromJson(json);
}

/// @nodoc
mixin _$CommonRes {
// required DataDto data,
  ResultDto? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonResCopyWith<CommonRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonResCopyWith<$Res> {
  factory $CommonResCopyWith(CommonRes value, $Res Function(CommonRes) then) =
      _$CommonResCopyWithImpl<$Res>;
  $Res call({ResultDto? result});

  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class _$CommonResCopyWithImpl<$Res> implements $CommonResCopyWith<$Res> {
  _$CommonResCopyWithImpl(this._value, this._then);

  final CommonRes _value;
  // ignore: unused_field
  final $Res Function(CommonRes) _then;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
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
abstract class _$$_CommonResCopyWith<$Res> implements $CommonResCopyWith<$Res> {
  factory _$$_CommonResCopyWith(
          _$_CommonRes value, $Res Function(_$_CommonRes) then) =
      __$$_CommonResCopyWithImpl<$Res>;
  @override
  $Res call({ResultDto? result});

  @override
  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_CommonResCopyWithImpl<$Res> extends _$CommonResCopyWithImpl<$Res>
    implements _$$_CommonResCopyWith<$Res> {
  __$$_CommonResCopyWithImpl(
      _$_CommonRes _value, $Res Function(_$_CommonRes) _then)
      : super(_value, (v) => _then(v as _$_CommonRes));

  @override
  _$_CommonRes get _value => super._value as _$_CommonRes;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_CommonRes(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommonRes implements _CommonRes {
  const _$_CommonRes({this.result});

  factory _$_CommonRes.fromJson(Map<String, dynamic> json) =>
      _$$_CommonResFromJson(json);

// required DataDto data,
  @override
  final ResultDto? result;

  @override
  String toString() {
    return 'CommonRes(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonRes &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_CommonResCopyWith<_$_CommonRes> get copyWith =>
      __$$_CommonResCopyWithImpl<_$_CommonRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommonResToJson(this);
  }
}

abstract class _CommonRes implements CommonRes {
  const factory _CommonRes({final ResultDto? result}) = _$_CommonRes;

  factory _CommonRes.fromJson(Map<String, dynamic> json) =
      _$_CommonRes.fromJson;

  @override // required DataDto data,
  ResultDto? get result => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CommonResCopyWith<_$_CommonRes> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultDto _$ResultDtoFromJson(Map<String, dynamic> json) {
  return _ResultDto.fromJson(json);
}

/// @nodoc
mixin _$ResultDto {
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ErrorDto>? get errorList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDtoCopyWith<ResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDtoCopyWith<$Res> {
  factory $ResultDtoCopyWith(ResultDto value, $Res Function(ResultDto) then) =
      _$ResultDtoCopyWithImpl<$Res>;
  $Res call({String? code, String? message, List<ErrorDto>? errorList});
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
    Object? errorList = freezed,
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
      errorList: errorList == freezed
          ? _value.errorList
          : errorList // ignore: cast_nullable_to_non_nullable
              as List<ErrorDto>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResultDtoCopyWith<$Res> implements $ResultDtoCopyWith<$Res> {
  factory _$$_ResultDtoCopyWith(
          _$_ResultDto value, $Res Function(_$_ResultDto) then) =
      __$$_ResultDtoCopyWithImpl<$Res>;
  @override
  $Res call({String? code, String? message, List<ErrorDto>? errorList});
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
    Object? errorList = freezed,
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
      errorList: errorList == freezed
          ? _value._errorList
          : errorList // ignore: cast_nullable_to_non_nullable
              as List<ErrorDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultDto implements _ResultDto {
  const _$_ResultDto({this.code, this.message, final List<ErrorDto>? errorList})
      : _errorList = errorList;

  factory _$_ResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_ResultDtoFromJson(json);

  @override
  final String? code;
  @override
  final String? message;
  final List<ErrorDto>? _errorList;
  @override
  List<ErrorDto>? get errorList {
    final value = _errorList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultDto(code: $code, message: $message, errorList: $errorList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultDto &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other._errorList, _errorList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(_errorList));

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
      {final String? code,
      final String? message,
      final List<ErrorDto>? errorList}) = _$_ResultDto;

  factory _ResultDto.fromJson(Map<String, dynamic> json) =
      _$_ResultDto.fromJson;

  @override
  String? get code => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  List<ErrorDto>? get errorList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ResultDtoCopyWith<_$_ResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ErrorDto _$ErrorDtoFromJson(Map<String, dynamic> json) {
  return _ErrorDto.fromJson(json);
}

/// @nodoc
mixin _$ErrorDto {
  String? get field => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorDtoCopyWith<ErrorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDtoCopyWith<$Res> {
  factory $ErrorDtoCopyWith(ErrorDto value, $Res Function(ErrorDto) then) =
      _$ErrorDtoCopyWithImpl<$Res>;
  $Res call({String? field, String? value, String? reason});
}

/// @nodoc
class _$ErrorDtoCopyWithImpl<$Res> implements $ErrorDtoCopyWith<$Res> {
  _$ErrorDtoCopyWithImpl(this._value, this._then);

  final ErrorDto _value;
  // ignore: unused_field
  final $Res Function(ErrorDto) _then;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ErrorDtoCopyWith<$Res> implements $ErrorDtoCopyWith<$Res> {
  factory _$$_ErrorDtoCopyWith(
          _$_ErrorDto value, $Res Function(_$_ErrorDto) then) =
      __$$_ErrorDtoCopyWithImpl<$Res>;
  @override
  $Res call({String? field, String? value, String? reason});
}

/// @nodoc
class __$$_ErrorDtoCopyWithImpl<$Res> extends _$ErrorDtoCopyWithImpl<$Res>
    implements _$$_ErrorDtoCopyWith<$Res> {
  __$$_ErrorDtoCopyWithImpl(
      _$_ErrorDto _value, $Res Function(_$_ErrorDto) _then)
      : super(_value, (v) => _then(v as _$_ErrorDto));

  @override
  _$_ErrorDto get _value => super._value as _$_ErrorDto;

  @override
  $Res call({
    Object? field = freezed,
    Object? value = freezed,
    Object? reason = freezed,
  }) {
    return _then(_$_ErrorDto(
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorDto implements _ErrorDto {
  const _$_ErrorDto({this.field, this.value, this.reason});

  factory _$_ErrorDto.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorDtoFromJson(json);

  @override
  final String? field;
  @override
  final String? value;
  @override
  final String? reason;

  @override
  String toString() {
    return 'ErrorDto(field: $field, value: $value, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorDto &&
            const DeepCollectionEquality().equals(other.field, field) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(field),
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorDtoCopyWith<_$_ErrorDto> get copyWith =>
      __$$_ErrorDtoCopyWithImpl<_$_ErrorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorDtoToJson(this);
  }
}

abstract class _ErrorDto implements ErrorDto {
  const factory _ErrorDto(
      {final String? field,
      final String? value,
      final String? reason}) = _$_ErrorDto;

  factory _ErrorDto.fromJson(Map<String, dynamic> json) = _$_ErrorDto.fromJson;

  @override
  String? get field => throw _privateConstructorUsedError;
  @override
  String? get value => throw _privateConstructorUsedError;
  @override
  String? get reason => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorDtoCopyWith<_$_ErrorDto> get copyWith =>
      throw _privateConstructorUsedError;
}
