import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/data/repo/helper/serializable.dart';

part 'places.freezed.dart';
part 'places.g.dart';

@freezed
class Places with _$Places {
  factory Places({
    @Default('') @JsonKey(name: KEY_PLACE_ID) String placeId,
    @Default('') @JsonKey(name: KEY_MATJIPNAME) String matjipName,
    @Default('') @JsonKey(name: KEY_CATEGORY_NAME) String? categoryName,
    @Default([]) @JsonKey(name: KEY_IMGURLS) List<dynamic> imageUrls,
    @Default([]) @JsonKey(name: KEY_THUMBNAILURLS) List<dynamic> thumbnailImageUrls,
    @Default([]) @JsonKey(name: KEY_TAGS) List<dynamic> tags,
    @Default([]) @JsonKey(name: KEY_LISTOFLIKES) List<dynamic> listOfLikes,
    @Default([]) @JsonKey(name: KEY_LIST_OF_REVIEW) List<dynamic> listOfReview,
    @JsonKey(name: KEY_USER_LOCATION_CODE) String? locationCode,
    @JsonKey(name: KEY_KAKAO_URL) String? kakaoUrl,
    @JsonKey(name: KEY_SUPPLY_COMPANY) String? supplyCompany,
    @JsonKey(name: KEY_PHONE) String? phone,
    @JsonKey(name: KEY_KAKAO_ID) String? kakaoId,
    @JsonKey(name: KEY_ORDER_CATEGORY) String? orderCategory,
    @JsonKey(name: KEY_CATEGORY_GROUP_NAME) String? categoryGroupName,
    @JsonKey(name: KEY_IS_MATJIP) bool? isMatjip,
    @Default(0) @JsonKey(name: KEY_COUNT_CHILD) num countChild,
    @Default(0) @JsonKey(name: KEY_ORDER_POINT, fromJson: Serializable.fromDouble) double orderPoint,
    @Default(0) @JsonKey(name: KEY_STAR_AVG) num starAvg,
  }) = _Places;

  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);
}
