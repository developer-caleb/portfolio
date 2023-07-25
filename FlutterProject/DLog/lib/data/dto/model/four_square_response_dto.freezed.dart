// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'four_square_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FourSquareResponseDto _$FourSquareResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _FourSquareResponseDto.fromJson(json);
}

/// @nodoc
mixin _$FourSquareResponseDto {
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;
  Map<String, dynamic>? get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FourSquareResponseDtoCopyWith<FourSquareResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FourSquareResponseDtoCopyWith<$Res> {
  factory $FourSquareResponseDtoCopyWith(FourSquareResponseDto value,
          $Res Function(FourSquareResponseDto) then) =
      _$FourSquareResponseDtoCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic>? meta, Map<String, dynamic>? response});
}

/// @nodoc
class _$FourSquareResponseDtoCopyWithImpl<$Res>
    implements $FourSquareResponseDtoCopyWith<$Res> {
  _$FourSquareResponseDtoCopyWithImpl(this._value, this._then);

  final FourSquareResponseDto _value;
  // ignore: unused_field
  final $Res Function(FourSquareResponseDto) _then;

  @override
  $Res call({
    Object? meta = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      meta: meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$$_FourSquareResponseDtoCopyWith<$Res>
    implements $FourSquareResponseDtoCopyWith<$Res> {
  factory _$$_FourSquareResponseDtoCopyWith(_$_FourSquareResponseDto value,
          $Res Function(_$_FourSquareResponseDto) then) =
      __$$_FourSquareResponseDtoCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic>? meta, Map<String, dynamic>? response});
}

/// @nodoc
class __$$_FourSquareResponseDtoCopyWithImpl<$Res>
    extends _$FourSquareResponseDtoCopyWithImpl<$Res>
    implements _$$_FourSquareResponseDtoCopyWith<$Res> {
  __$$_FourSquareResponseDtoCopyWithImpl(_$_FourSquareResponseDto _value,
      $Res Function(_$_FourSquareResponseDto) _then)
      : super(_value, (v) => _then(v as _$_FourSquareResponseDto));

  @override
  _$_FourSquareResponseDto get _value =>
      super._value as _$_FourSquareResponseDto;

  @override
  $Res call({
    Object? meta = freezed,
    Object? response = freezed,
  }) {
    return _then(_$_FourSquareResponseDto(
      meta: meta == freezed
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      response: response == freezed
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FourSquareResponseDto implements _FourSquareResponseDto {
  _$_FourSquareResponseDto(
      {final Map<String, dynamic>? meta, final Map<String, dynamic>? response})
      : _meta = meta,
        _response = response;

  factory _$_FourSquareResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_FourSquareResponseDtoFromJson(json);

  final Map<String, dynamic>? _meta;
  @override
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _response;
  @override
  Map<String, dynamic>? get response {
    final value = _response;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FourSquareResponseDto(meta: $meta, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FourSquareResponseDto &&
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_meta),
      const DeepCollectionEquality().hash(_response));

  @JsonKey(ignore: true)
  @override
  _$$_FourSquareResponseDtoCopyWith<_$_FourSquareResponseDto> get copyWith =>
      __$$_FourSquareResponseDtoCopyWithImpl<_$_FourSquareResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FourSquareResponseDtoToJson(this);
  }
}

abstract class _FourSquareResponseDto implements FourSquareResponseDto {
  factory _FourSquareResponseDto(
      {final Map<String, dynamic>? meta,
      final Map<String, dynamic>? response}) = _$_FourSquareResponseDto;

  factory _FourSquareResponseDto.fromJson(Map<String, dynamic> json) =
      _$_FourSquareResponseDto.fromJson;

  @override
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get response => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FourSquareResponseDtoCopyWith<_$_FourSquareResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
