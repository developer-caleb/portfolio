// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'writer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Writer _$WriterFromJson(Map<String, dynamic> json) {
  return _Writer.fromJson(json);
}

/// @nodoc
mixin _$Writer {
  @JsonKey(name: KEY_WRITERIMG)
  String get img => throw _privateConstructorUsedError; // = map[KEY_WRITERIMG],
  @JsonKey(name: KEY_MAKERUID)
  String get uid => throw _privateConstructorUsedError; // = map[KEY_MAKERUID],
  @JsonKey(name: KEY_MAKERNAME)
  String get name => throw _privateConstructorUsedError; //= map[KEY_MAKERNAME],
  @JsonKey(name: KEY_MAKER_FOLLOWERS)
  List<dynamic> get followers =>
      throw _privateConstructorUsedError; // = map[KEY_MAKER_FOLLOWERS] ?? [],
  @JsonKey(name: KEY_WRITERPRIVATE)
  bool get private =>
      throw _privateConstructorUsedError; // = map[KEY_WRITERPRIVATE] ?? false,
  @JsonKey(name: KEY_WRITER_BANNED)
  bool get banned => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_USER_LOCATION_CODE)
  String? get locationCode => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_USER_LANGUAGE_CODE)
  String? get languageCode => throw _privateConstructorUsedError;
  @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE)
  bool get isImgCircle =>
      throw _privateConstructorUsedError; // = map[KEY_IS_WRITER_IMG_CIRCLE] ?? true,
  @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR)
  int get backgroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WriterCopyWith<Writer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WriterCopyWith<$Res> {
  factory $WriterCopyWith(Writer value, $Res Function(Writer) then) =
      _$WriterCopyWithImpl<$Res, Writer>;
  @useResult
  $Res call(
      {@JsonKey(name: KEY_WRITERIMG) String img,
      @JsonKey(name: KEY_MAKERUID) String uid,
      @JsonKey(name: KEY_MAKERNAME) String name,
      @JsonKey(name: KEY_MAKER_FOLLOWERS) List<dynamic> followers,
      @JsonKey(name: KEY_WRITERPRIVATE) bool private,
      @JsonKey(name: KEY_WRITER_BANNED) bool banned,
      @JsonKey(name: KEY_USER_LOCATION_CODE) String? locationCode,
      @JsonKey(name: KEY_USER_LANGUAGE_CODE) String? languageCode,
      @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE) bool isImgCircle,
      @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR) int backgroundColor});
}

/// @nodoc
class _$WriterCopyWithImpl<$Res, $Val extends Writer>
    implements $WriterCopyWith<$Res> {
  _$WriterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img = null,
    Object? uid = null,
    Object? name = null,
    Object? followers = null,
    Object? private = null,
    Object? banned = null,
    Object? locationCode = freezed,
    Object? languageCode = freezed,
    Object? isImgCircle = null,
    Object? backgroundColor = null,
  }) {
    return _then(_value.copyWith(
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isImgCircle: null == isImgCircle
          ? _value.isImgCircle
          : isImgCircle // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WriterCopyWith<$Res> implements $WriterCopyWith<$Res> {
  factory _$$_WriterCopyWith(_$_Writer value, $Res Function(_$_Writer) then) =
      __$$_WriterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: KEY_WRITERIMG) String img,
      @JsonKey(name: KEY_MAKERUID) String uid,
      @JsonKey(name: KEY_MAKERNAME) String name,
      @JsonKey(name: KEY_MAKER_FOLLOWERS) List<dynamic> followers,
      @JsonKey(name: KEY_WRITERPRIVATE) bool private,
      @JsonKey(name: KEY_WRITER_BANNED) bool banned,
      @JsonKey(name: KEY_USER_LOCATION_CODE) String? locationCode,
      @JsonKey(name: KEY_USER_LANGUAGE_CODE) String? languageCode,
      @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE) bool isImgCircle,
      @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR) int backgroundColor});
}

/// @nodoc
class __$$_WriterCopyWithImpl<$Res>
    extends _$WriterCopyWithImpl<$Res, _$_Writer>
    implements _$$_WriterCopyWith<$Res> {
  __$$_WriterCopyWithImpl(_$_Writer _value, $Res Function(_$_Writer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img = null,
    Object? uid = null,
    Object? name = null,
    Object? followers = null,
    Object? private = null,
    Object? banned = null,
    Object? locationCode = freezed,
    Object? languageCode = freezed,
    Object? isImgCircle = null,
    Object? backgroundColor = null,
  }) {
    return _then(_$_Writer(
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      private: null == private
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      banned: null == banned
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isImgCircle: null == isImgCircle
          ? _value.isImgCircle
          : isImgCircle // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Writer implements _Writer {
  _$_Writer(
      {@JsonKey(name: KEY_WRITERIMG)
          this.img = '',
      @JsonKey(name: KEY_MAKERUID)
          this.uid = '',
      @JsonKey(name: KEY_MAKERNAME)
          this.name = '',
      @JsonKey(name: KEY_MAKER_FOLLOWERS)
          final List<dynamic> followers = const [],
      @JsonKey(name: KEY_WRITERPRIVATE)
          this.private = false,
      @JsonKey(name: KEY_WRITER_BANNED)
          this.banned = false,
      @JsonKey(name: KEY_USER_LOCATION_CODE)
          this.locationCode,
      @JsonKey(name: KEY_USER_LANGUAGE_CODE)
          this.languageCode,
      @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE)
          this.isImgCircle = true,
      @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR)
          this.backgroundColor = 4294967295})
      : _followers = followers;

  factory _$_Writer.fromJson(Map<String, dynamic> json) =>
      _$$_WriterFromJson(json);

  @override
  @JsonKey(name: KEY_WRITERIMG)
  final String img;
// = map[KEY_WRITERIMG],
  @override
  @JsonKey(name: KEY_MAKERUID)
  final String uid;
// = map[KEY_MAKERUID],
  @override
  @JsonKey(name: KEY_MAKERNAME)
  final String name;
//= map[KEY_MAKERNAME],
  final List<dynamic> _followers;
//= map[KEY_MAKERNAME],
  @override
  @JsonKey(name: KEY_MAKER_FOLLOWERS)
  List<dynamic> get followers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

// = map[KEY_MAKER_FOLLOWERS] ?? [],
  @override
  @JsonKey(name: KEY_WRITERPRIVATE)
  final bool private;
// = map[KEY_WRITERPRIVATE] ?? false,
  @override
  @JsonKey(name: KEY_WRITER_BANNED)
  final bool banned;
  @override
  @JsonKey(name: KEY_USER_LOCATION_CODE)
  final String? locationCode;
  @override
  @JsonKey(name: KEY_USER_LANGUAGE_CODE)
  final String? languageCode;
  @override
  @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE)
  final bool isImgCircle;
// = map[KEY_IS_WRITER_IMG_CIRCLE] ?? true,
  @override
  @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR)
  final int backgroundColor;

  @override
  String toString() {
    return 'Writer(img: $img, uid: $uid, name: $name, followers: $followers, private: $private, banned: $banned, locationCode: $locationCode, languageCode: $languageCode, isImgCircle: $isImgCircle, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Writer &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            (identical(other.private, private) || other.private == private) &&
            (identical(other.banned, banned) || other.banned == banned) &&
            (identical(other.locationCode, locationCode) ||
                other.locationCode == locationCode) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.isImgCircle, isImgCircle) ||
                other.isImgCircle == isImgCircle) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      img,
      uid,
      name,
      const DeepCollectionEquality().hash(_followers),
      private,
      banned,
      locationCode,
      languageCode,
      isImgCircle,
      backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      __$$_WriterCopyWithImpl<_$_Writer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WriterToJson(
      this,
    );
  }
}

abstract class _Writer implements Writer {
  factory _Writer(
      {@JsonKey(name: KEY_WRITERIMG)
          final String img,
      @JsonKey(name: KEY_MAKERUID)
          final String uid,
      @JsonKey(name: KEY_MAKERNAME)
          final String name,
      @JsonKey(name: KEY_MAKER_FOLLOWERS)
          final List<dynamic> followers,
      @JsonKey(name: KEY_WRITERPRIVATE)
          final bool private,
      @JsonKey(name: KEY_WRITER_BANNED)
          final bool banned,
      @JsonKey(name: KEY_USER_LOCATION_CODE)
          final String? locationCode,
      @JsonKey(name: KEY_USER_LANGUAGE_CODE)
          final String? languageCode,
      @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE)
          final bool isImgCircle,
      @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR)
          final int backgroundColor}) = _$_Writer;

  factory _Writer.fromJson(Map<String, dynamic> json) = _$_Writer.fromJson;

  @override
  @JsonKey(name: KEY_WRITERIMG)
  String get img;
  @override // = map[KEY_WRITERIMG],
  @JsonKey(name: KEY_MAKERUID)
  String get uid;
  @override // = map[KEY_MAKERUID],
  @JsonKey(name: KEY_MAKERNAME)
  String get name;
  @override //= map[KEY_MAKERNAME],
  @JsonKey(name: KEY_MAKER_FOLLOWERS)
  List<dynamic> get followers;
  @override // = map[KEY_MAKER_FOLLOWERS] ?? [],
  @JsonKey(name: KEY_WRITERPRIVATE)
  bool get private;
  @override // = map[KEY_WRITERPRIVATE] ?? false,
  @JsonKey(name: KEY_WRITER_BANNED)
  bool get banned;
  @override
  @JsonKey(name: KEY_USER_LOCATION_CODE)
  String? get locationCode;
  @override
  @JsonKey(name: KEY_USER_LANGUAGE_CODE)
  String? get languageCode;
  @override
  @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE)
  bool get isImgCircle;
  @override // = map[KEY_IS_WRITER_IMG_CIRCLE] ?? true,
  @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR)
  int get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_WriterCopyWith<_$_Writer> get copyWith =>
      throw _privateConstructorUsedError;
}
