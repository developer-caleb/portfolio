// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'only_result_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnlyResultDto _$OnlyResultDtoFromJson(Map<String, dynamic> json) {
  return _OnlyResultDto.fromJson(json);
}

/// @nodoc
mixin _$OnlyResultDto {
  ResultDto? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnlyResultDtoCopyWith<OnlyResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlyResultDtoCopyWith<$Res> {
  factory $OnlyResultDtoCopyWith(
          OnlyResultDto value, $Res Function(OnlyResultDto) then) =
      _$OnlyResultDtoCopyWithImpl<$Res>;
  $Res call({ResultDto? result});

  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class _$OnlyResultDtoCopyWithImpl<$Res>
    implements $OnlyResultDtoCopyWith<$Res> {
  _$OnlyResultDtoCopyWithImpl(this._value, this._then);

  final OnlyResultDto _value;
  // ignore: unused_field
  final $Res Function(OnlyResultDto) _then;

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
abstract class _$$_OnlyResultDtoCopyWith<$Res>
    implements $OnlyResultDtoCopyWith<$Res> {
  factory _$$_OnlyResultDtoCopyWith(
          _$_OnlyResultDto value, $Res Function(_$_OnlyResultDto) then) =
      __$$_OnlyResultDtoCopyWithImpl<$Res>;
  @override
  $Res call({ResultDto? result});

  @override
  $ResultDtoCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_OnlyResultDtoCopyWithImpl<$Res>
    extends _$OnlyResultDtoCopyWithImpl<$Res>
    implements _$$_OnlyResultDtoCopyWith<$Res> {
  __$$_OnlyResultDtoCopyWithImpl(
      _$_OnlyResultDto _value, $Res Function(_$_OnlyResultDto) _then)
      : super(_value, (v) => _then(v as _$_OnlyResultDto));

  @override
  _$_OnlyResultDto get _value => super._value as _$_OnlyResultDto;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$_OnlyResultDto(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as ResultDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OnlyResultDto implements _OnlyResultDto {
  const _$_OnlyResultDto({required this.result});

  factory _$_OnlyResultDto.fromJson(Map<String, dynamic> json) =>
      _$$_OnlyResultDtoFromJson(json);

  @override
  final ResultDto? result;

  @override
  String toString() {
    return 'OnlyResultDto(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnlyResultDto &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_OnlyResultDtoCopyWith<_$_OnlyResultDto> get copyWith =>
      __$$_OnlyResultDtoCopyWithImpl<_$_OnlyResultDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnlyResultDtoToJson(this);
  }
}

abstract class _OnlyResultDto implements OnlyResultDto {
  const factory _OnlyResultDto({required final ResultDto? result}) =
      _$_OnlyResultDto;

  factory _OnlyResultDto.fromJson(Map<String, dynamic> json) =
      _$_OnlyResultDto.fromJson;

  @override
  ResultDto? get result => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_OnlyResultDtoCopyWith<_$_OnlyResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}
