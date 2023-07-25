// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return _Geo.fromJson(json);
}

/// @nodoc
mixin _$Geo {
  @JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
  int? get mapColor => throw _privateConstructorUsedError;
  @JsonKey(
      name: KEY_GEO_LOCATION,
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint)
  @JsonKey(
      name: '_geoloc',
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint)
  GeoPoint? get geolocation => throw _privateConstructorUsedError;
  @JsonKey(
      name: KEY_PLACE_LOC,
      fromJson: Serializable.fromGeoFirePoint,
      toJson: Serializable.toJsonGeoFirePoint)
  GeoFirePoint? get placeLoc => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_ADDRESS)
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_ADDRESS_SIMPLE)
  String? get addressSimple => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_ADDRESSDETAIL)
  String? get addressDetail => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_ADDRESSCODE)
  String? get addressCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoCopyWith<Geo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoCopyWith<$Res> {
  factory $GeoCopyWith(Geo value, $Res Function(Geo) then) =
      _$GeoCopyWithImpl<$Res, Geo>;
  @useResult
  $Res call(
      {@JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
          int? mapColor,
      @JsonKey(
          name: KEY_GEO_LOCATION,
          fromJson: Serializable.fromGeoPoint,
          toJson: Serializable.toJsonGeoPoint)
      @JsonKey(name: '_geoloc', fromJson: Serializable.fromGeoPoint, toJson: Serializable.toJsonGeoPoint)
          GeoPoint? geolocation,
      @JsonKey(name: KEY_PLACE_LOC, fromJson: Serializable.fromGeoFirePoint, toJson: Serializable.toJsonGeoFirePoint)
          GeoFirePoint? placeLoc,
      @JsonKey(name: KEY_ADDRESS)
          String? address,
      @JsonKey(name: KEY_ADDRESS_SIMPLE)
          String? addressSimple,
      @JsonKey(name: KEY_ADDRESSDETAIL)
          String? addressDetail,
      @JsonKey(name: KEY_ADDRESSCODE)
          String? addressCode});
}

/// @nodoc
class _$GeoCopyWithImpl<$Res, $Val extends Geo> implements $GeoCopyWith<$Res> {
  _$GeoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapColor = freezed,
    Object? geolocation = freezed,
    Object? placeLoc = freezed,
    Object? address = freezed,
    Object? addressSimple = freezed,
    Object? addressDetail = freezed,
    Object? addressCode = freezed,
  }) {
    return _then(_value.copyWith(
      mapColor: freezed == mapColor
          ? _value.mapColor
          : mapColor // ignore: cast_nullable_to_non_nullable
              as int?,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      placeLoc: freezed == placeLoc
          ? _value.placeLoc
          : placeLoc // ignore: cast_nullable_to_non_nullable
              as GeoFirePoint?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressSimple: freezed == addressSimple
          ? _value.addressSimple
          : addressSimple // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDetail: freezed == addressDetail
          ? _value.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      addressCode: freezed == addressCode
          ? _value.addressCode
          : addressCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoCopyWith<$Res> implements $GeoCopyWith<$Res> {
  factory _$$_GeoCopyWith(_$_Geo value, $Res Function(_$_Geo) then) =
      __$$_GeoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
          int? mapColor,
      @JsonKey(
          name: KEY_GEO_LOCATION,
          fromJson: Serializable.fromGeoPoint,
          toJson: Serializable.toJsonGeoPoint)
      @JsonKey(name: '_geoloc', fromJson: Serializable.fromGeoPoint, toJson: Serializable.toJsonGeoPoint)
          GeoPoint? geolocation,
      @JsonKey(name: KEY_PLACE_LOC, fromJson: Serializable.fromGeoFirePoint, toJson: Serializable.toJsonGeoFirePoint)
          GeoFirePoint? placeLoc,
      @JsonKey(name: KEY_ADDRESS)
          String? address,
      @JsonKey(name: KEY_ADDRESS_SIMPLE)
          String? addressSimple,
      @JsonKey(name: KEY_ADDRESSDETAIL)
          String? addressDetail,
      @JsonKey(name: KEY_ADDRESSCODE)
          String? addressCode});
}

/// @nodoc
class __$$_GeoCopyWithImpl<$Res> extends _$GeoCopyWithImpl<$Res, _$_Geo>
    implements _$$_GeoCopyWith<$Res> {
  __$$_GeoCopyWithImpl(_$_Geo _value, $Res Function(_$_Geo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapColor = freezed,
    Object? geolocation = freezed,
    Object? placeLoc = freezed,
    Object? address = freezed,
    Object? addressSimple = freezed,
    Object? addressDetail = freezed,
    Object? addressCode = freezed,
  }) {
    return _then(_$_Geo(
      mapColor: freezed == mapColor
          ? _value.mapColor
          : mapColor // ignore: cast_nullable_to_non_nullable
              as int?,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      placeLoc: freezed == placeLoc
          ? _value.placeLoc
          : placeLoc // ignore: cast_nullable_to_non_nullable
              as GeoFirePoint?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressSimple: freezed == addressSimple
          ? _value.addressSimple
          : addressSimple // ignore: cast_nullable_to_non_nullable
              as String?,
      addressDetail: freezed == addressDetail
          ? _value.addressDetail
          : addressDetail // ignore: cast_nullable_to_non_nullable
              as String?,
      addressCode: freezed == addressCode
          ? _value.addressCode
          : addressCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geo implements _Geo {
  _$_Geo(
      {@JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
          this.mapColor,
      @JsonKey(
          name: KEY_GEO_LOCATION,
          fromJson: Serializable.fromGeoPoint,
          toJson: Serializable.toJsonGeoPoint)
      @JsonKey(name: '_geoloc', fromJson: Serializable.fromGeoPoint, toJson: Serializable.toJsonGeoPoint)
          this.geolocation,
      @JsonKey(name: KEY_PLACE_LOC, fromJson: Serializable.fromGeoFirePoint, toJson: Serializable.toJsonGeoFirePoint)
          this.placeLoc,
      @JsonKey(name: KEY_ADDRESS)
          this.address = '',
      @JsonKey(name: KEY_ADDRESS_SIMPLE)
          this.addressSimple = '',
      @JsonKey(name: KEY_ADDRESSDETAIL)
          this.addressDetail = '',
      @JsonKey(name: KEY_ADDRESSCODE)
          this.addressCode = ''});

  factory _$_Geo.fromJson(Map<String, dynamic> json) => _$$_GeoFromJson(json);

  @override
  @JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
  final int? mapColor;
  @override
  @JsonKey(
      name: KEY_GEO_LOCATION,
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint)
  @JsonKey(
      name: '_geoloc',
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint)
  final GeoPoint? geolocation;
  @override
  @JsonKey(
      name: KEY_PLACE_LOC,
      fromJson: Serializable.fromGeoFirePoint,
      toJson: Serializable.toJsonGeoFirePoint)
  final GeoFirePoint? placeLoc;
  @override
  @JsonKey(name: KEY_ADDRESS)
  final String? address;
  @override
  @JsonKey(name: KEY_ADDRESS_SIMPLE)
  final String? addressSimple;
  @override
  @JsonKey(name: KEY_ADDRESSDETAIL)
  final String? addressDetail;
  @override
  @JsonKey(name: KEY_ADDRESSCODE)
  final String? addressCode;

  @override
  String toString() {
    return 'Geo(mapColor: $mapColor, geolocation: $geolocation, placeLoc: $placeLoc, address: $address, addressSimple: $addressSimple, addressDetail: $addressDetail, addressCode: $addressCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geo &&
            (identical(other.mapColor, mapColor) ||
                other.mapColor == mapColor) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation) &&
            (identical(other.placeLoc, placeLoc) ||
                other.placeLoc == placeLoc) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressSimple, addressSimple) ||
                other.addressSimple == addressSimple) &&
            (identical(other.addressDetail, addressDetail) ||
                other.addressDetail == addressDetail) &&
            (identical(other.addressCode, addressCode) ||
                other.addressCode == addressCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mapColor, geolocation, placeLoc,
      address, addressSimple, addressDetail, addressCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoCopyWith<_$_Geo> get copyWith =>
      __$$_GeoCopyWithImpl<_$_Geo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoToJson(
      this,
    );
  }
}

abstract class _Geo implements Geo {
  factory _Geo(
      {@JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
          final int? mapColor,
      @JsonKey(
          name: KEY_GEO_LOCATION,
          fromJson: Serializable.fromGeoPoint,
          toJson: Serializable.toJsonGeoPoint)
      @JsonKey(name: '_geoloc', fromJson: Serializable.fromGeoPoint, toJson: Serializable.toJsonGeoPoint)
          final GeoPoint? geolocation,
      @JsonKey(name: KEY_PLACE_LOC, fromJson: Serializable.fromGeoFirePoint, toJson: Serializable.toJsonGeoFirePoint)
          final GeoFirePoint? placeLoc,
      @JsonKey(name: KEY_ADDRESS)
          final String? address,
      @JsonKey(name: KEY_ADDRESS_SIMPLE)
          final String? addressSimple,
      @JsonKey(name: KEY_ADDRESSDETAIL)
          final String? addressDetail,
      @JsonKey(name: KEY_ADDRESSCODE)
          final String? addressCode}) = _$_Geo;

  factory _Geo.fromJson(Map<String, dynamic> json) = _$_Geo.fromJson;

  @override
  @JsonKey(name: KEY_MAP_COLOR, fromJson: Serializable.frommMapColor)
  int? get mapColor;
  @override
  @JsonKey(
      name: KEY_GEO_LOCATION,
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint)
  @JsonKey(
      name: '_geoloc',
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint)
  GeoPoint? get geolocation;
  @override
  @JsonKey(
      name: KEY_PLACE_LOC,
      fromJson: Serializable.fromGeoFirePoint,
      toJson: Serializable.toJsonGeoFirePoint)
  GeoFirePoint? get placeLoc;
  @override
  @JsonKey(name: KEY_ADDRESS)
  String? get address;
  @override
  @JsonKey(name: KEY_ADDRESS_SIMPLE)
  String? get addressSimple;
  @override
  @JsonKey(name: KEY_ADDRESSDETAIL)
  String? get addressDetail;
  @override
  @JsonKey(name: KEY_ADDRESSCODE)
  String? get addressCode;
  @override
  @JsonKey(ignore: true)
  _$$_GeoCopyWith<_$_Geo> get copyWith => throw _privateConstructorUsedError;
}
