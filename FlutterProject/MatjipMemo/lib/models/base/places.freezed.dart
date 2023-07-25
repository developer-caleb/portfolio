// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'places.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Places _$PlacesFromJson(Map<String, dynamic> json) {
  return _Places.fromJson(json);
}

/// @nodoc
mixin _$Places {
  @JsonKey(name: KEY_PLACE_ID)
  String get placeId => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_MATJIPNAME)
  String get matjipName => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_CATEGORY_NAME)
  String? get categoryName => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_IMGURLS)
  List<dynamic> get imageUrls => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_THUMBNAILURLS)
  List<dynamic> get thumbnailImageUrls => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_TAGS)
  List<dynamic> get tags => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_LISTOFLIKES)
  List<dynamic> get listOfLikes => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_LIST_OF_REVIEW)
  List<dynamic> get listOfReview => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_USER_LOCATION_CODE)
  String? get locationCode => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_KAKAO_URL)
  String? get kakaoUrl => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_SUPPLY_COMPANY)
  String? get supplyCompany => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_PHONE)
  String? get phone => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_KAKAO_ID)
  String? get kakaoId => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_ORDER_CATEGORY)
  String? get orderCategory => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_CATEGORY_GROUP_NAME)
  String? get categoryGroupName => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_IS_MATJIP)
  bool? get isMatjip => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_COUNT_CHILD)
  num get countChild => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble)
  double get orderPoint => throw _privateConstructorUsedError;

  @JsonKey(name: KEY_STAR_AVG)
  num get starAvg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlacesCopyWith<Places> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesCopyWith<$Res> {
  factory $PlacesCopyWith(Places value, $Res Function(Places) then) = _$PlacesCopyWithImpl<$Res, Places>;

  @useResult
  $Res call(
      {@JsonKey(name: KEY_PLACE_ID) String placeId,
      @JsonKey(name: KEY_MATJIPNAME) String matjipName,
      @JsonKey(name: KEY_CATEGORY_NAME) String? categoryName,
      @JsonKey(name: KEY_IMGURLS) List<dynamic> imageUrls,
      @JsonKey(name: KEY_THUMBNAILURLS) List<dynamic> thumbnailImageUrls,
      @JsonKey(name: KEY_TAGS) List<dynamic> tags,
      @JsonKey(name: KEY_LISTOFLIKES) List<dynamic> listOfLikes,
      @JsonKey(name: KEY_LIST_OF_REVIEW) List<dynamic> listOfReview,
      @JsonKey(name: KEY_USER_LOCATION_CODE) String? locationCode,
      @JsonKey(name: KEY_KAKAO_URL) String? kakaoUrl,
      @JsonKey(name: KEY_SUPPLY_COMPANY) String? supplyCompany,
      @JsonKey(name: KEY_PHONE) String? phone,
      @JsonKey(name: KEY_KAKAO_ID) String? kakaoId,
      @JsonKey(name: KEY_ORDER_CATEGORY) String? orderCategory,
      @JsonKey(name: KEY_CATEGORY_GROUP_NAME) String? categoryGroupName,
      @JsonKey(name: KEY_IS_MATJIP) bool? isMatjip,
      @JsonKey(name: KEY_COUNT_CHILD) num countChild,
      @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble) double orderPoint,
      @JsonKey(name: KEY_STAR_AVG) num starAvg});
}

/// @nodoc
class _$PlacesCopyWithImpl<$Res, $Val extends Places> implements $PlacesCopyWith<$Res> {
  _$PlacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? matjipName = null,
    Object? categoryName = freezed,
    Object? imageUrls = null,
    Object? thumbnailImageUrls = null,
    Object? tags = null,
    Object? listOfLikes = null,
    Object? listOfReview = null,
    Object? locationCode = freezed,
    Object? kakaoUrl = freezed,
    Object? supplyCompany = freezed,
    Object? phone = freezed,
    Object? kakaoId = freezed,
    Object? orderCategory = freezed,
    Object? categoryGroupName = freezed,
    Object? isMatjip = freezed,
    Object? countChild = null,
    Object? orderPoint = null,
    Object? starAvg = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      matjipName: null == matjipName
          ? _value.matjipName
          : matjipName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      thumbnailImageUrls: null == thumbnailImageUrls
          ? _value.thumbnailImageUrls
          : thumbnailImageUrls // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      listOfLikes: null == listOfLikes
          ? _value.listOfLikes
          : listOfLikes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      listOfReview: null == listOfReview
          ? _value.listOfReview
          : listOfReview // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      kakaoUrl: freezed == kakaoUrl
          ? _value.kakaoUrl
          : kakaoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplyCompany: freezed == supplyCompany
          ? _value.supplyCompany
          : supplyCompany // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      kakaoId: freezed == kakaoId
          ? _value.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderCategory: freezed == orderCategory
          ? _value.orderCategory
          : orderCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryGroupName: freezed == categoryGroupName
          ? _value.categoryGroupName
          : categoryGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      isMatjip: freezed == isMatjip
          ? _value.isMatjip
          : isMatjip // ignore: cast_nullable_to_non_nullable
              as bool?,
      countChild: null == countChild
          ? _value.countChild
          : countChild // ignore: cast_nullable_to_non_nullable
              as num,
      orderPoint: null == orderPoint
          ? _value.orderPoint
          : orderPoint // ignore: cast_nullable_to_non_nullable
              as double,
      starAvg: null == starAvg
          ? _value.starAvg
          : starAvg // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlacesCopyWith<$Res> implements $PlacesCopyWith<$Res> {
  factory _$$_PlacesCopyWith(_$_Places value, $Res Function(_$_Places) then) = __$$_PlacesCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {@JsonKey(name: KEY_PLACE_ID) String placeId,
      @JsonKey(name: KEY_MATJIPNAME) String matjipName,
      @JsonKey(name: KEY_CATEGORY_NAME) String? categoryName,
      @JsonKey(name: KEY_IMGURLS) List<dynamic> imageUrls,
      @JsonKey(name: KEY_THUMBNAILURLS) List<dynamic> thumbnailImageUrls,
      @JsonKey(name: KEY_TAGS) List<dynamic> tags,
      @JsonKey(name: KEY_LISTOFLIKES) List<dynamic> listOfLikes,
      @JsonKey(name: KEY_LIST_OF_REVIEW) List<dynamic> listOfReview,
      @JsonKey(name: KEY_USER_LOCATION_CODE) String? locationCode,
      @JsonKey(name: KEY_KAKAO_URL) String? kakaoUrl,
      @JsonKey(name: KEY_SUPPLY_COMPANY) String? supplyCompany,
      @JsonKey(name: KEY_PHONE) String? phone,
      @JsonKey(name: KEY_KAKAO_ID) String? kakaoId,
      @JsonKey(name: KEY_ORDER_CATEGORY) String? orderCategory,
      @JsonKey(name: KEY_CATEGORY_GROUP_NAME) String? categoryGroupName,
      @JsonKey(name: KEY_IS_MATJIP) bool? isMatjip,
      @JsonKey(name: KEY_COUNT_CHILD) num countChild,
      @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble) double orderPoint,
      @JsonKey(name: KEY_STAR_AVG) num starAvg});
}

/// @nodoc
class __$$_PlacesCopyWithImpl<$Res> extends _$PlacesCopyWithImpl<$Res, _$_Places> implements _$$_PlacesCopyWith<$Res> {
  __$$_PlacesCopyWithImpl(_$_Places _value, $Res Function(_$_Places) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? matjipName = null,
    Object? categoryName = freezed,
    Object? imageUrls = null,
    Object? thumbnailImageUrls = null,
    Object? tags = null,
    Object? listOfLikes = null,
    Object? listOfReview = null,
    Object? locationCode = freezed,
    Object? kakaoUrl = freezed,
    Object? supplyCompany = freezed,
    Object? phone = freezed,
    Object? kakaoId = freezed,
    Object? orderCategory = freezed,
    Object? categoryGroupName = freezed,
    Object? isMatjip = freezed,
    Object? countChild = null,
    Object? orderPoint = null,
    Object? starAvg = null,
  }) {
    return _then(_$_Places(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      matjipName: null == matjipName
          ? _value.matjipName
          : matjipName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      thumbnailImageUrls: null == thumbnailImageUrls
          ? _value._thumbnailImageUrls
          : thumbnailImageUrls // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      listOfLikes: null == listOfLikes
          ? _value._listOfLikes
          : listOfLikes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      listOfReview: null == listOfReview
          ? _value._listOfReview
          : listOfReview // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      locationCode: freezed == locationCode
          ? _value.locationCode
          : locationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      kakaoUrl: freezed == kakaoUrl
          ? _value.kakaoUrl
          : kakaoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      supplyCompany: freezed == supplyCompany
          ? _value.supplyCompany
          : supplyCompany // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      kakaoId: freezed == kakaoId
          ? _value.kakaoId
          : kakaoId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderCategory: freezed == orderCategory
          ? _value.orderCategory
          : orderCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryGroupName: freezed == categoryGroupName
          ? _value.categoryGroupName
          : categoryGroupName // ignore: cast_nullable_to_non_nullable
              as String?,
      isMatjip: freezed == isMatjip
          ? _value.isMatjip
          : isMatjip // ignore: cast_nullable_to_non_nullable
              as bool?,
      countChild: null == countChild
          ? _value.countChild
          : countChild // ignore: cast_nullable_to_non_nullable
              as num,
      orderPoint: null == orderPoint
          ? _value.orderPoint
          : orderPoint // ignore: cast_nullable_to_non_nullable
              as double,
      starAvg: null == starAvg
          ? _value.starAvg
          : starAvg // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Places implements _Places {
  _$_Places(
      {@JsonKey(name: KEY_PLACE_ID) this.placeId = '',
      @JsonKey(name: KEY_MATJIPNAME) this.matjipName = '',
      @JsonKey(name: KEY_CATEGORY_NAME) this.categoryName = '',
      @JsonKey(name: KEY_IMGURLS) final List<dynamic> imageUrls = const [],
      @JsonKey(name: KEY_THUMBNAILURLS) final List<dynamic> thumbnailImageUrls = const [],
      @JsonKey(name: KEY_TAGS) final List<dynamic> tags = const [],
      @JsonKey(name: KEY_LISTOFLIKES) final List<dynamic> listOfLikes = const [],
      @JsonKey(name: KEY_LIST_OF_REVIEW) final List<dynamic> listOfReview = const [],
      @JsonKey(name: KEY_USER_LOCATION_CODE) this.locationCode,
      @JsonKey(name: KEY_KAKAO_URL) this.kakaoUrl,
      @JsonKey(name: KEY_SUPPLY_COMPANY) this.supplyCompany,
      @JsonKey(name: KEY_PHONE) this.phone,
      @JsonKey(name: KEY_KAKAO_ID) this.kakaoId,
      @JsonKey(name: KEY_ORDER_CATEGORY) this.orderCategory,
      @JsonKey(name: KEY_CATEGORY_GROUP_NAME) this.categoryGroupName,
      @JsonKey(name: KEY_IS_MATJIP) this.isMatjip,
      @JsonKey(name: KEY_COUNT_CHILD) this.countChild = 0,
      @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble) this.orderPoint = 0,
      @JsonKey(name: KEY_STAR_AVG) this.starAvg = 0})
      : _imageUrls = imageUrls,
        _thumbnailImageUrls = thumbnailImageUrls,
        _tags = tags,
        _listOfLikes = listOfLikes,
        _listOfReview = listOfReview;

  factory _$_Places.fromJson(Map<String, dynamic> json) => _$$_PlacesFromJson(json);

  @override
  @JsonKey(name: KEY_PLACE_ID)
  final String placeId;
  @override
  @JsonKey(name: KEY_MATJIPNAME)
  final String matjipName;
  @override
  @JsonKey(name: KEY_CATEGORY_NAME)
  final String? categoryName;
  final List<dynamic> _imageUrls;

  @override
  @JsonKey(name: KEY_IMGURLS)
  List<dynamic> get imageUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<dynamic> _thumbnailImageUrls;

  @override
  @JsonKey(name: KEY_THUMBNAILURLS)
  List<dynamic> get thumbnailImageUrls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnailImageUrls);
  }

  final List<dynamic> _tags;

  @override
  @JsonKey(name: KEY_TAGS)
  List<dynamic> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<dynamic> _listOfLikes;

  @override
  @JsonKey(name: KEY_LISTOFLIKES)
  List<dynamic> get listOfLikes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfLikes);
  }

  final List<dynamic> _listOfReview;

  @override
  @JsonKey(name: KEY_LIST_OF_REVIEW)
  List<dynamic> get listOfReview {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfReview);
  }

  @override
  @JsonKey(name: KEY_USER_LOCATION_CODE)
  final String? locationCode;
  @override
  @JsonKey(name: KEY_KAKAO_URL)
  final String? kakaoUrl;
  @override
  @JsonKey(name: KEY_SUPPLY_COMPANY)
  final String? supplyCompany;
  @override
  @JsonKey(name: KEY_PHONE)
  final String? phone;
  @override
  @JsonKey(name: KEY_KAKAO_ID)
  final String? kakaoId;
  @override
  @JsonKey(name: KEY_ORDER_CATEGORY)
  final String? orderCategory;
  @override
  @JsonKey(name: KEY_CATEGORY_GROUP_NAME)
  final String? categoryGroupName;
  @override
  @JsonKey(name: KEY_IS_MATJIP)
  final bool? isMatjip;
  @override
  @JsonKey(name: KEY_COUNT_CHILD)
  final num countChild;
  @override
  @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble)
  final double orderPoint;
  @override
  @JsonKey(name: KEY_STAR_AVG)
  final num starAvg;

  @override
  String toString() {
    return 'Places(placeId: $placeId, matjipName: $matjipName, categoryName: $categoryName, imageUrls: $imageUrls, thumbnailImageUrls: $thumbnailImageUrls, tags: $tags, listOfLikes: $listOfLikes, listOfReview: $listOfReview, locationCode: $locationCode, kakaoUrl: $kakaoUrl, supplyCompany: $supplyCompany, phone: $phone, kakaoId: $kakaoId, orderCategory: $orderCategory, categoryGroupName: $categoryGroupName, isMatjip: $isMatjip, countChild: $countChild, orderPoint: $orderPoint, starAvg: $starAvg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Places &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.matjipName, matjipName) || other.matjipName == matjipName) &&
            (identical(other.categoryName, categoryName) || other.categoryName == categoryName) &&
            const DeepCollectionEquality().equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality().equals(other._thumbnailImageUrls, _thumbnailImageUrls) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._listOfLikes, _listOfLikes) &&
            const DeepCollectionEquality().equals(other._listOfReview, _listOfReview) &&
            (identical(other.locationCode, locationCode) || other.locationCode == locationCode) &&
            (identical(other.kakaoUrl, kakaoUrl) || other.kakaoUrl == kakaoUrl) &&
            (identical(other.supplyCompany, supplyCompany) || other.supplyCompany == supplyCompany) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.kakaoId, kakaoId) || other.kakaoId == kakaoId) &&
            (identical(other.orderCategory, orderCategory) || other.orderCategory == orderCategory) &&
            (identical(other.categoryGroupName, categoryGroupName) || other.categoryGroupName == categoryGroupName) &&
            (identical(other.isMatjip, isMatjip) || other.isMatjip == isMatjip) &&
            (identical(other.countChild, countChild) || other.countChild == countChild) &&
            (identical(other.orderPoint, orderPoint) || other.orderPoint == orderPoint) &&
            (identical(other.starAvg, starAvg) || other.starAvg == starAvg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        placeId,
        matjipName,
        categoryName,
        const DeepCollectionEquality().hash(_imageUrls),
        const DeepCollectionEquality().hash(_thumbnailImageUrls),
        const DeepCollectionEquality().hash(_tags),
        const DeepCollectionEquality().hash(_listOfLikes),
        const DeepCollectionEquality().hash(_listOfReview),
        locationCode,
        kakaoUrl,
        supplyCompany,
        phone,
        kakaoId,
        orderCategory,
        categoryGroupName,
        isMatjip,
        countChild,
        orderPoint,
        starAvg
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlacesCopyWith<_$_Places> get copyWith => __$$_PlacesCopyWithImpl<_$_Places>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlacesToJson(
      this,
    );
  }
}

abstract class _Places implements Places {
  factory _Places(
      {@JsonKey(name: KEY_PLACE_ID) final String placeId,
      @JsonKey(name: KEY_MATJIPNAME) final String matjipName,
      @JsonKey(name: KEY_CATEGORY_NAME) final String? categoryName,
      @JsonKey(name: KEY_IMGURLS) final List<dynamic> imageUrls,
      @JsonKey(name: KEY_THUMBNAILURLS) final List<dynamic> thumbnailImageUrls,
      @JsonKey(name: KEY_TAGS) final List<dynamic> tags,
      @JsonKey(name: KEY_LISTOFLIKES) final List<dynamic> listOfLikes,
      @JsonKey(name: KEY_LIST_OF_REVIEW) final List<dynamic> listOfReview,
      @JsonKey(name: KEY_USER_LOCATION_CODE) final String? locationCode,
      @JsonKey(name: KEY_KAKAO_URL) final String? kakaoUrl,
      @JsonKey(name: KEY_SUPPLY_COMPANY) final String? supplyCompany,
      @JsonKey(name: KEY_PHONE) final String? phone,
      @JsonKey(name: KEY_KAKAO_ID) final String? kakaoId,
      @JsonKey(name: KEY_ORDER_CATEGORY) final String? orderCategory,
      @JsonKey(name: KEY_CATEGORY_GROUP_NAME) final String? categoryGroupName,
      @JsonKey(name: KEY_IS_MATJIP) final bool? isMatjip,
      @JsonKey(name: KEY_COUNT_CHILD) final num countChild,
      @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble) final double orderPoint,
      @JsonKey(name: KEY_STAR_AVG) final num starAvg}) = _$_Places;

  factory _Places.fromJson(Map<String, dynamic> json) = _$_Places.fromJson;

  @override
  @JsonKey(name: KEY_PLACE_ID)
  String get placeId;

  @override
  @JsonKey(name: KEY_MATJIPNAME)
  String get matjipName;

  @override
  @JsonKey(name: KEY_CATEGORY_NAME)
  String? get categoryName;

  @override
  @JsonKey(name: KEY_IMGURLS)
  List<dynamic> get imageUrls;

  @override
  @JsonKey(name: KEY_THUMBNAILURLS)
  List<dynamic> get thumbnailImageUrls;

  @override
  @JsonKey(name: KEY_TAGS)
  List<dynamic> get tags;

  @override
  @JsonKey(name: KEY_LISTOFLIKES)
  List<dynamic> get listOfLikes;

  @override
  @JsonKey(name: KEY_LIST_OF_REVIEW)
  List<dynamic> get listOfReview;

  @override
  @JsonKey(name: KEY_USER_LOCATION_CODE)
  String? get locationCode;

  @override
  @JsonKey(name: KEY_KAKAO_URL)
  String? get kakaoUrl;

  @override
  @JsonKey(name: KEY_SUPPLY_COMPANY)
  String? get supplyCompany;

  @override
  @JsonKey(name: KEY_PHONE)
  String? get phone;

  @override
  @JsonKey(name: KEY_KAKAO_ID)
  String? get kakaoId;

  @override
  @JsonKey(name: KEY_ORDER_CATEGORY)
  String? get orderCategory;

  @override
  @JsonKey(name: KEY_CATEGORY_GROUP_NAME)
  String? get categoryGroupName;

  @override
  @JsonKey(name: KEY_IS_MATJIP)
  bool? get isMatjip;

  @override
  @JsonKey(name: KEY_COUNT_CHILD)
  num get countChild;

  @override
  @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble)
  double get orderPoint;

  @override
  @JsonKey(name: KEY_STAR_AVG)
  num get starAvg;

  @override
  @JsonKey(ignore: true)
  _$$_PlacesCopyWith<_$_Places> get copyWith => throw _privateConstructorUsedError;
}
