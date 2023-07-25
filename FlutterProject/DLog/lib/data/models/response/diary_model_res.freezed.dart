// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'diary_model_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiaryModelRes _$DiaryModelResFromJson(Map<String, dynamic> json) {
  return _DiaryModelRes.fromJson(json);
}

/// @nodoc
mixin _$DiaryModelRes {
  int get diarySeq => throw _privateConstructorUsedError;
  int get userSeq => throw _privateConstructorUsedError;
  String get dateTime => throw _privateConstructorUsedError;
  String get bodyText => throw _privateConstructorUsedError;
  String get emotion => throw _privateConstructorUsedError;
  String get weather => throw _privateConstructorUsedError;
  DiaryResource? get diaryResource => throw _privateConstructorUsedError;
  DiaryGps? get diaryGps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryModelResCopyWith<DiaryModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryModelResCopyWith<$Res> {
  factory $DiaryModelResCopyWith(
          DiaryModelRes value, $Res Function(DiaryModelRes) then) =
      _$DiaryModelResCopyWithImpl<$Res>;
  $Res call(
      {int diarySeq,
      int userSeq,
      String dateTime,
      String bodyText,
      String emotion,
      String weather,
      DiaryResource? diaryResource,
      DiaryGps? diaryGps});

  $DiaryResourceCopyWith<$Res>? get diaryResource;
  $DiaryGpsCopyWith<$Res>? get diaryGps;
}

/// @nodoc
class _$DiaryModelResCopyWithImpl<$Res>
    implements $DiaryModelResCopyWith<$Res> {
  _$DiaryModelResCopyWithImpl(this._value, this._then);

  final DiaryModelRes _value;
  // ignore: unused_field
  final $Res Function(DiaryModelRes) _then;

  @override
  $Res call({
    Object? diarySeq = freezed,
    Object? userSeq = freezed,
    Object? dateTime = freezed,
    Object? bodyText = freezed,
    Object? emotion = freezed,
    Object? weather = freezed,
    Object? diaryResource = freezed,
    Object? diaryGps = freezed,
  }) {
    return _then(_value.copyWith(
      diarySeq: diarySeq == freezed
          ? _value.diarySeq
          : diarySeq // ignore: cast_nullable_to_non_nullable
              as int,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      bodyText: bodyText == freezed
          ? _value.bodyText
          : bodyText // ignore: cast_nullable_to_non_nullable
              as String,
      emotion: emotion == freezed
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String,
      diaryResource: diaryResource == freezed
          ? _value.diaryResource
          : diaryResource // ignore: cast_nullable_to_non_nullable
              as DiaryResource?,
      diaryGps: diaryGps == freezed
          ? _value.diaryGps
          : diaryGps // ignore: cast_nullable_to_non_nullable
              as DiaryGps?,
    ));
  }

  @override
  $DiaryResourceCopyWith<$Res>? get diaryResource {
    if (_value.diaryResource == null) {
      return null;
    }

    return $DiaryResourceCopyWith<$Res>(_value.diaryResource!, (value) {
      return _then(_value.copyWith(diaryResource: value));
    });
  }

  @override
  $DiaryGpsCopyWith<$Res>? get diaryGps {
    if (_value.diaryGps == null) {
      return null;
    }

    return $DiaryGpsCopyWith<$Res>(_value.diaryGps!, (value) {
      return _then(_value.copyWith(diaryGps: value));
    });
  }
}

/// @nodoc
abstract class _$$_DiaryModelResCopyWith<$Res>
    implements $DiaryModelResCopyWith<$Res> {
  factory _$$_DiaryModelResCopyWith(
          _$_DiaryModelRes value, $Res Function(_$_DiaryModelRes) then) =
      __$$_DiaryModelResCopyWithImpl<$Res>;
  @override
  $Res call(
      {int diarySeq,
      int userSeq,
      String dateTime,
      String bodyText,
      String emotion,
      String weather,
      DiaryResource? diaryResource,
      DiaryGps? diaryGps});

  @override
  $DiaryResourceCopyWith<$Res>? get diaryResource;
  @override
  $DiaryGpsCopyWith<$Res>? get diaryGps;
}

/// @nodoc
class __$$_DiaryModelResCopyWithImpl<$Res>
    extends _$DiaryModelResCopyWithImpl<$Res>
    implements _$$_DiaryModelResCopyWith<$Res> {
  __$$_DiaryModelResCopyWithImpl(
      _$_DiaryModelRes _value, $Res Function(_$_DiaryModelRes) _then)
      : super(_value, (v) => _then(v as _$_DiaryModelRes));

  @override
  _$_DiaryModelRes get _value => super._value as _$_DiaryModelRes;

  @override
  $Res call({
    Object? diarySeq = freezed,
    Object? userSeq = freezed,
    Object? dateTime = freezed,
    Object? bodyText = freezed,
    Object? emotion = freezed,
    Object? weather = freezed,
    Object? diaryResource = freezed,
    Object? diaryGps = freezed,
  }) {
    return _then(_$_DiaryModelRes(
      diarySeq: diarySeq == freezed
          ? _value.diarySeq
          : diarySeq // ignore: cast_nullable_to_non_nullable
              as int,
      userSeq: userSeq == freezed
          ? _value.userSeq
          : userSeq // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      bodyText: bodyText == freezed
          ? _value.bodyText
          : bodyText // ignore: cast_nullable_to_non_nullable
              as String,
      emotion: emotion == freezed
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String,
      weather: weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as String,
      diaryResource: diaryResource == freezed
          ? _value.diaryResource
          : diaryResource // ignore: cast_nullable_to_non_nullable
              as DiaryResource?,
      diaryGps: diaryGps == freezed
          ? _value.diaryGps
          : diaryGps // ignore: cast_nullable_to_non_nullable
              as DiaryGps?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryModelRes implements _DiaryModelRes {
  const _$_DiaryModelRes(
      {required this.diarySeq,
      required this.userSeq,
      required this.dateTime,
      required this.bodyText,
      required this.emotion,
      required this.weather,
      this.diaryResource,
      this.diaryGps});

  factory _$_DiaryModelRes.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryModelResFromJson(json);

  @override
  final int diarySeq;
  @override
  final int userSeq;
  @override
  final String dateTime;
  @override
  final String bodyText;
  @override
  final String emotion;
  @override
  final String weather;
  @override
  final DiaryResource? diaryResource;
  @override
  final DiaryGps? diaryGps;

  @override
  String toString() {
    return 'DiaryModelRes(diarySeq: $diarySeq, userSeq: $userSeq, dateTime: $dateTime, bodyText: $bodyText, emotion: $emotion, weather: $weather, diaryResource: $diaryResource, diaryGps: $diaryGps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryModelRes &&
            const DeepCollectionEquality().equals(other.diarySeq, diarySeq) &&
            const DeepCollectionEquality().equals(other.userSeq, userSeq) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.bodyText, bodyText) &&
            const DeepCollectionEquality().equals(other.emotion, emotion) &&
            const DeepCollectionEquality().equals(other.weather, weather) &&
            const DeepCollectionEquality()
                .equals(other.diaryResource, diaryResource) &&
            const DeepCollectionEquality().equals(other.diaryGps, diaryGps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(diarySeq),
      const DeepCollectionEquality().hash(userSeq),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(bodyText),
      const DeepCollectionEquality().hash(emotion),
      const DeepCollectionEquality().hash(weather),
      const DeepCollectionEquality().hash(diaryResource),
      const DeepCollectionEquality().hash(diaryGps));

  @JsonKey(ignore: true)
  @override
  _$$_DiaryModelResCopyWith<_$_DiaryModelRes> get copyWith =>
      __$$_DiaryModelResCopyWithImpl<_$_DiaryModelRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryModelResToJson(this);
  }
}

abstract class _DiaryModelRes implements DiaryModelRes {
  const factory _DiaryModelRes(
      {required final int diarySeq,
      required final int userSeq,
      required final String dateTime,
      required final String bodyText,
      required final String emotion,
      required final String weather,
      final DiaryResource? diaryResource,
      final DiaryGps? diaryGps}) = _$_DiaryModelRes;

  factory _DiaryModelRes.fromJson(Map<String, dynamic> json) =
      _$_DiaryModelRes.fromJson;

  @override
  int get diarySeq => throw _privateConstructorUsedError;
  @override
  int get userSeq => throw _privateConstructorUsedError;
  @override
  String get dateTime => throw _privateConstructorUsedError;
  @override
  String get bodyText => throw _privateConstructorUsedError;
  @override
  String get emotion => throw _privateConstructorUsedError;
  @override
  String get weather => throw _privateConstructorUsedError;
  @override
  DiaryResource? get diaryResource => throw _privateConstructorUsedError;
  @override
  DiaryGps? get diaryGps => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryModelResCopyWith<_$_DiaryModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

DiaryResource _$DiaryResourceFromJson(Map<String, dynamic> json) {
  return _DiaryResource.fromJson(json);
}

/// @nodoc
mixin _$DiaryResource {
  String get imgUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryResourceCopyWith<DiaryResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryResourceCopyWith<$Res> {
  factory $DiaryResourceCopyWith(
          DiaryResource value, $Res Function(DiaryResource) then) =
      _$DiaryResourceCopyWithImpl<$Res>;
  $Res call({String imgUrl});
}

/// @nodoc
class _$DiaryResourceCopyWithImpl<$Res>
    implements $DiaryResourceCopyWith<$Res> {
  _$DiaryResourceCopyWithImpl(this._value, this._then);

  final DiaryResource _value;
  // ignore: unused_field
  final $Res Function(DiaryResource) _then;

  @override
  $Res call({
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DiaryResourceCopyWith<$Res>
    implements $DiaryResourceCopyWith<$Res> {
  factory _$$_DiaryResourceCopyWith(
          _$_DiaryResource value, $Res Function(_$_DiaryResource) then) =
      __$$_DiaryResourceCopyWithImpl<$Res>;
  @override
  $Res call({String imgUrl});
}

/// @nodoc
class __$$_DiaryResourceCopyWithImpl<$Res>
    extends _$DiaryResourceCopyWithImpl<$Res>
    implements _$$_DiaryResourceCopyWith<$Res> {
  __$$_DiaryResourceCopyWithImpl(
      _$_DiaryResource _value, $Res Function(_$_DiaryResource) _then)
      : super(_value, (v) => _then(v as _$_DiaryResource));

  @override
  _$_DiaryResource get _value => super._value as _$_DiaryResource;

  @override
  $Res call({
    Object? imgUrl = freezed,
  }) {
    return _then(_$_DiaryResource(
      imgUrl: imgUrl == freezed
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryResource implements _DiaryResource {
  const _$_DiaryResource({required this.imgUrl});

  factory _$_DiaryResource.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryResourceFromJson(json);

  @override
  final String imgUrl;

  @override
  String toString() {
    return 'DiaryResource(imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryResource &&
            const DeepCollectionEquality().equals(other.imgUrl, imgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(imgUrl));

  @JsonKey(ignore: true)
  @override
  _$$_DiaryResourceCopyWith<_$_DiaryResource> get copyWith =>
      __$$_DiaryResourceCopyWithImpl<_$_DiaryResource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryResourceToJson(this);
  }
}

abstract class _DiaryResource implements DiaryResource {
  const factory _DiaryResource({required final String imgUrl}) =
      _$_DiaryResource;

  factory _DiaryResource.fromJson(Map<String, dynamic> json) =
      _$_DiaryResource.fromJson;

  @override
  String get imgUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryResourceCopyWith<_$_DiaryResource> get copyWith =>
      throw _privateConstructorUsedError;
}

DiaryGps _$DiaryGpsFromJson(Map<String, dynamic> json) {
  return _DiaryGps.fromJson(json);
}

/// @nodoc
mixin _$DiaryGps {
  String get name => throw _privateConstructorUsedError;
  String? get fsqId => throw _privateConstructorUsedError;
  Geocode? get geocode => throw _privateConstructorUsedError;
  List<Category>? get categoryList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiaryGpsCopyWith<DiaryGps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiaryGpsCopyWith<$Res> {
  factory $DiaryGpsCopyWith(DiaryGps value, $Res Function(DiaryGps) then) =
      _$DiaryGpsCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? fsqId,
      Geocode? geocode,
      List<Category>? categoryList});

  $GeocodeCopyWith<$Res>? get geocode;
}

/// @nodoc
class _$DiaryGpsCopyWithImpl<$Res> implements $DiaryGpsCopyWith<$Res> {
  _$DiaryGpsCopyWithImpl(this._value, this._then);

  final DiaryGps _value;
  // ignore: unused_field
  final $Res Function(DiaryGps) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? fsqId = freezed,
    Object? geocode = freezed,
    Object? categoryList = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fsqId: fsqId == freezed
          ? _value.fsqId
          : fsqId // ignore: cast_nullable_to_non_nullable
              as String?,
      geocode: geocode == freezed
          ? _value.geocode
          : geocode // ignore: cast_nullable_to_non_nullable
              as Geocode?,
      categoryList: categoryList == freezed
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }

  @override
  $GeocodeCopyWith<$Res>? get geocode {
    if (_value.geocode == null) {
      return null;
    }

    return $GeocodeCopyWith<$Res>(_value.geocode!, (value) {
      return _then(_value.copyWith(geocode: value));
    });
  }
}

/// @nodoc
abstract class _$$_DiaryGpsCopyWith<$Res> implements $DiaryGpsCopyWith<$Res> {
  factory _$$_DiaryGpsCopyWith(
          _$_DiaryGps value, $Res Function(_$_DiaryGps) then) =
      __$$_DiaryGpsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? fsqId,
      Geocode? geocode,
      List<Category>? categoryList});

  @override
  $GeocodeCopyWith<$Res>? get geocode;
}

/// @nodoc
class __$$_DiaryGpsCopyWithImpl<$Res> extends _$DiaryGpsCopyWithImpl<$Res>
    implements _$$_DiaryGpsCopyWith<$Res> {
  __$$_DiaryGpsCopyWithImpl(
      _$_DiaryGps _value, $Res Function(_$_DiaryGps) _then)
      : super(_value, (v) => _then(v as _$_DiaryGps));

  @override
  _$_DiaryGps get _value => super._value as _$_DiaryGps;

  @override
  $Res call({
    Object? name = freezed,
    Object? fsqId = freezed,
    Object? geocode = freezed,
    Object? categoryList = freezed,
  }) {
    return _then(_$_DiaryGps(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fsqId: fsqId == freezed
          ? _value.fsqId
          : fsqId // ignore: cast_nullable_to_non_nullable
              as String?,
      geocode: geocode == freezed
          ? _value.geocode
          : geocode // ignore: cast_nullable_to_non_nullable
              as Geocode?,
      categoryList: categoryList == freezed
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiaryGps implements _DiaryGps {
  const _$_DiaryGps(
      {required this.name,
      this.fsqId = '',
      this.geocode,
      final List<Category>? categoryList})
      : _categoryList = categoryList;

  factory _$_DiaryGps.fromJson(Map<String, dynamic> json) =>
      _$$_DiaryGpsFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String? fsqId;
  @override
  final Geocode? geocode;
  final List<Category>? _categoryList;
  @override
  List<Category>? get categoryList {
    final value = _categoryList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiaryGps(name: $name, fsqId: $fsqId, geocode: $geocode, categoryList: $categoryList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiaryGps &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.fsqId, fsqId) &&
            const DeepCollectionEquality().equals(other.geocode, geocode) &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(fsqId),
      const DeepCollectionEquality().hash(geocode),
      const DeepCollectionEquality().hash(_categoryList));

  @JsonKey(ignore: true)
  @override
  _$$_DiaryGpsCopyWith<_$_DiaryGps> get copyWith =>
      __$$_DiaryGpsCopyWithImpl<_$_DiaryGps>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiaryGpsToJson(this);
  }
}

abstract class _DiaryGps implements DiaryGps {
  const factory _DiaryGps(
      {required final String name,
      final String? fsqId,
      final Geocode? geocode,
      final List<Category>? categoryList}) = _$_DiaryGps;

  factory _DiaryGps.fromJson(Map<String, dynamic> json) = _$_DiaryGps.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get fsqId => throw _privateConstructorUsedError;
  @override
  Geocode? get geocode => throw _privateConstructorUsedError;
  @override
  List<Category>? get categoryList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DiaryGpsCopyWith<_$_DiaryGps> get copyWith =>
      throw _privateConstructorUsedError;
}

Geocode _$GeocodeFromJson(Map<String, dynamic> json) {
  return _Geocode.fromJson(json);
}

/// @nodoc
mixin _$Geocode {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodeCopyWith<Geocode> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodeCopyWith<$Res> {
  factory $GeocodeCopyWith(Geocode value, $Res Function(Geocode) then) =
      _$GeocodeCopyWithImpl<$Res>;
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class _$GeocodeCopyWithImpl<$Res> implements $GeocodeCopyWith<$Res> {
  _$GeocodeCopyWithImpl(this._value, this._then);

  final Geocode _value;
  // ignore: unused_field
  final $Res Function(Geocode) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_GeocodeCopyWith<$Res> implements $GeocodeCopyWith<$Res> {
  factory _$$_GeocodeCopyWith(
          _$_Geocode value, $Res Function(_$_Geocode) then) =
      __$$_GeocodeCopyWithImpl<$Res>;
  @override
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class __$$_GeocodeCopyWithImpl<$Res> extends _$GeocodeCopyWithImpl<$Res>
    implements _$$_GeocodeCopyWith<$Res> {
  __$$_GeocodeCopyWithImpl(_$_Geocode _value, $Res Function(_$_Geocode) _then)
      : super(_value, (v) => _then(v as _$_Geocode));

  @override
  _$_Geocode get _value => super._value as _$_Geocode;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_Geocode(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geocode implements _Geocode {
  const _$_Geocode({this.latitude = 0.0, this.longitude = 0.0});

  factory _$_Geocode.fromJson(Map<String, dynamic> json) =>
      _$$_GeocodeFromJson(json);

  @override
  @JsonKey()
  final double? latitude;
  @override
  @JsonKey()
  final double? longitude;

  @override
  String toString() {
    return 'Geocode(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geocode &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  _$$_GeocodeCopyWith<_$_Geocode> get copyWith =>
      __$$_GeocodeCopyWithImpl<_$_Geocode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeocodeToJson(this);
  }
}

abstract class _Geocode implements Geocode {
  const factory _Geocode({final double? latitude, final double? longitude}) =
      _$_Geocode;

  factory _Geocode.fromJson(Map<String, dynamic> json) = _$_Geocode.fromJson;

  @override
  double? get latitude => throw _privateConstructorUsedError;
  @override
  double? get longitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GeocodeCopyWith<_$_Geocode> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? icon});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
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
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? icon});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, (v) => _then(v as _$_Category));

  @override
  _$_Category get _value => super._value as _$_Category;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$_Category(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category({this.id = '', this.name = '', this.icon = ''});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? icon;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {final String? id, final String? name, final String? icon}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}
