// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_volumes_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetVolumesRes _$GetVolumesResFromJson(Map<String, dynamic> json) {
  return _GetVolumesRes.fromJson(json);
}

/// @nodoc
mixin _$GetVolumesRes {
  DataDto? get data => throw _privateConstructorUsedError;
  ResultDto? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetVolumesResCopyWith<GetVolumesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetVolumesResCopyWith<$Res> {
  factory $GetVolumesResCopyWith(
          GetVolumesRes value, $Res Function(GetVolumesRes) then) =
      _$GetVolumesResCopyWithImpl<$Res>;
  $Res call({DataDto? data, ResultDto? result});

  $DataDtoCopyWith<$Res>? get data;
  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class _$GetVolumesResCopyWithImpl<$Res>
    implements $GetVolumesResCopyWith<$Res> {
  _$GetVolumesResCopyWithImpl(this._value, this._then);

  final GetVolumesRes _value;
  // ignore: unused_field
  final $Res Function(GetVolumesRes) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataDto?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
  }

  @override
  $DataDtoCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataDtoCopyWith<$Res>(_value.data!, (value) {
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
abstract class _$$_GetVolumesResCopyWith<$Res>
    implements $GetVolumesResCopyWith<$Res> {
  factory _$$_GetVolumesResCopyWith(
          _$_GetVolumesRes value, $Res Function(_$_GetVolumesRes) then) =
      __$$_GetVolumesResCopyWithImpl<$Res>;
  @override
  $Res call({DataDto? data, ResultDto? result});

  @override
  $DataDtoCopyWith<$Res>? get data;
  @override
  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_GetVolumesResCopyWithImpl<$Res>
    extends _$GetVolumesResCopyWithImpl<$Res>
    implements _$$_GetVolumesResCopyWith<$Res> {
  __$$_GetVolumesResCopyWithImpl(
      _$_GetVolumesRes _value, $Res Function(_$_GetVolumesRes) _then)
      : super(_value, (v) => _then(v as _$_GetVolumesRes));

  @override
  _$_GetVolumesRes get _value => super._value as _$_GetVolumesRes;

  @override
  $Res call({
    Object? data = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_GetVolumesRes(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataDto?,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetVolumesRes implements _GetVolumesRes {
  const _$_GetVolumesRes({this.data, this.result});

  factory _$_GetVolumesRes.fromJson(Map<String, dynamic> json) =>
      _$$_GetVolumesResFromJson(json);

  @override
  final DataDto? data;
  @override
  final ResultDto? result;

  @override
  String toString() {
    return 'GetVolumesRes(data: $data, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetVolumesRes &&
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
  _$$_GetVolumesResCopyWith<_$_GetVolumesRes> get copyWith =>
      __$$_GetVolumesResCopyWithImpl<_$_GetVolumesRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetVolumesResToJson(this);
  }
}

abstract class _GetVolumesRes implements GetVolumesRes {
  const factory _GetVolumesRes({final DataDto? data, final ResultDto? result}) =
      _$_GetVolumesRes;

  factory _GetVolumesRes.fromJson(Map<String, dynamic> json) =
      _$_GetVolumesRes.fromJson;

  @override
  DataDto? get data => throw _privateConstructorUsedError;
  @override
  ResultDto? get result => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GetVolumesResCopyWith<_$_GetVolumesRes> get copyWith =>
      throw _privateConstructorUsedError;
}

DataDto _$DataDtoFromJson(Map<String, dynamic> json) {
  return _DataDto.fromJson(json);
}

/// @nodoc
mixin _$DataDto {
  int? get total => throw _privateConstructorUsedError;
  List<VolumeModelRes>? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataDtoCopyWith<DataDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataDtoCopyWith<$Res> {
  factory $DataDtoCopyWith(DataDto value, $Res Function(DataDto) then) =
      _$DataDtoCopyWithImpl<$Res>;
  $Res call({int? total, List<VolumeModelRes>? list});
}

/// @nodoc
class _$DataDtoCopyWithImpl<$Res> implements $DataDtoCopyWith<$Res> {
  _$DataDtoCopyWithImpl(this._value, this._then);

  final DataDto _value;
  // ignore: unused_field
  final $Res Function(DataDto) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<VolumeModelRes>?,
    ));
  }
}

/// @nodoc
abstract class _$$_DataDtoCopyWith<$Res> implements $DataDtoCopyWith<$Res> {
  factory _$$_DataDtoCopyWith(
          _$_DataDto value, $Res Function(_$_DataDto) then) =
      __$$_DataDtoCopyWithImpl<$Res>;
  @override
  $Res call({int? total, List<VolumeModelRes>? list});
}

/// @nodoc
class __$$_DataDtoCopyWithImpl<$Res> extends _$DataDtoCopyWithImpl<$Res>
    implements _$$_DataDtoCopyWith<$Res> {
  __$$_DataDtoCopyWithImpl(_$_DataDto _value, $Res Function(_$_DataDto) _then)
      : super(_value, (v) => _then(v as _$_DataDto));

  @override
  _$_DataDto get _value => super._value as _$_DataDto;

  @override
  $Res call({
    Object? total = freezed,
    Object? list = freezed,
  }) {
    return _then(_$_DataDto(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<VolumeModelRes>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataDto implements _DataDto {
  const _$_DataDto({this.total, final List<VolumeModelRes>? list})
      : _list = list;

  factory _$_DataDto.fromJson(Map<String, dynamic> json) =>
      _$$_DataDtoFromJson(json);

  @override
  final int? total;
  final List<VolumeModelRes>? _list;
  @override
  List<VolumeModelRes>? get list {
    final value = _list;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataDto(total: $total, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataDto &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  _$$_DataDtoCopyWith<_$_DataDto> get copyWith =>
      __$$_DataDtoCopyWithImpl<_$_DataDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataDtoToJson(this);
  }
}

abstract class _DataDto implements DataDto {
  const factory _DataDto({final int? total, final List<VolumeModelRes>? list}) =
      _$_DataDto;

  factory _DataDto.fromJson(Map<String, dynamic> json) = _$_DataDto.fromJson;

  @override
  int? get total => throw _privateConstructorUsedError;
  @override
  List<VolumeModelRes>? get list => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DataDtoCopyWith<_$_DataDto> get copyWith =>
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
