// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'four_square_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FourSquareCategoryDto _$FourSquareCategoryDtoFromJson(
    Map<String, dynamic> json) {
  return _FourSquareCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$FourSquareCategoryDto {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get pluralName => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  Map<String, dynamic>? get icon => throw _privateConstructorUsedError;
  bool? get primary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FourSquareCategoryDtoCopyWith<FourSquareCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FourSquareCategoryDtoCopyWith<$Res> {
  factory $FourSquareCategoryDtoCopyWith(FourSquareCategoryDto value,
          $Res Function(FourSquareCategoryDto) then) =
      _$FourSquareCategoryDtoCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? pluralName,
      String? shortName,
      Map<String, dynamic>? icon,
      bool? primary});
}

/// @nodoc
class _$FourSquareCategoryDtoCopyWithImpl<$Res>
    implements $FourSquareCategoryDtoCopyWith<$Res> {
  _$FourSquareCategoryDtoCopyWithImpl(this._value, this._then);

  final FourSquareCategoryDto _value;
  // ignore: unused_field
  final $Res Function(FourSquareCategoryDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? pluralName = freezed,
    Object? shortName = freezed,
    Object? icon = freezed,
    Object? primary = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pluralName: pluralName == freezed
          ? _value.pluralName
          : pluralName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      primary: primary == freezed
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_FourSquareCategoryDtoCopyWith<$Res>
    implements $FourSquareCategoryDtoCopyWith<$Res> {
  factory _$$_FourSquareCategoryDtoCopyWith(_$_FourSquareCategoryDto value,
          $Res Function(_$_FourSquareCategoryDto) then) =
      __$$_FourSquareCategoryDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? pluralName,
      String? shortName,
      Map<String, dynamic>? icon,
      bool? primary});
}

/// @nodoc
class __$$_FourSquareCategoryDtoCopyWithImpl<$Res>
    extends _$FourSquareCategoryDtoCopyWithImpl<$Res>
    implements _$$_FourSquareCategoryDtoCopyWith<$Res> {
  __$$_FourSquareCategoryDtoCopyWithImpl(_$_FourSquareCategoryDto _value,
      $Res Function(_$_FourSquareCategoryDto) _then)
      : super(_value, (v) => _then(v as _$_FourSquareCategoryDto));

  @override
  _$_FourSquareCategoryDto get _value =>
      super._value as _$_FourSquareCategoryDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? pluralName = freezed,
    Object? shortName = freezed,
    Object? icon = freezed,
    Object? primary = freezed,
  }) {
    return _then(_$_FourSquareCategoryDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pluralName: pluralName == freezed
          ? _value.pluralName
          : pluralName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: shortName == freezed
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value._icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      primary: primary == freezed
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FourSquareCategoryDto implements _FourSquareCategoryDto {
  _$_FourSquareCategoryDto(
      {this.id,
      this.name,
      this.pluralName,
      this.shortName,
      final Map<String, dynamic>? icon,
      this.primary})
      : _icon = icon;

  factory _$_FourSquareCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_FourSquareCategoryDtoFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? pluralName;
  @override
  final String? shortName;
  final Map<String, dynamic>? _icon;
  @override
  Map<String, dynamic>? get icon {
    final value = _icon;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? primary;

  @override
  String toString() {
    return 'FourSquareCategoryDto(id: $id, name: $name, pluralName: $pluralName, shortName: $shortName, icon: $icon, primary: $primary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FourSquareCategoryDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.pluralName, pluralName) &&
            const DeepCollectionEquality().equals(other.shortName, shortName) &&
            const DeepCollectionEquality().equals(other._icon, _icon) &&
            const DeepCollectionEquality().equals(other.primary, primary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(pluralName),
      const DeepCollectionEquality().hash(shortName),
      const DeepCollectionEquality().hash(_icon),
      const DeepCollectionEquality().hash(primary));

  @JsonKey(ignore: true)
  @override
  _$$_FourSquareCategoryDtoCopyWith<_$_FourSquareCategoryDto> get copyWith =>
      __$$_FourSquareCategoryDtoCopyWithImpl<_$_FourSquareCategoryDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FourSquareCategoryDtoToJson(this);
  }
}

abstract class _FourSquareCategoryDto implements FourSquareCategoryDto {
  factory _FourSquareCategoryDto(
      {final String? id,
      final String? name,
      final String? pluralName,
      final String? shortName,
      final Map<String, dynamic>? icon,
      final bool? primary}) = _$_FourSquareCategoryDto;

  factory _FourSquareCategoryDto.fromJson(Map<String, dynamic> json) =
      _$_FourSquareCategoryDto.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get pluralName => throw _privateConstructorUsedError;
  @override
  String? get shortName => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get icon => throw _privateConstructorUsedError;
  @override
  bool? get primary => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FourSquareCategoryDtoCopyWith<_$_FourSquareCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}
