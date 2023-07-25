import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_model_req.freezed.dart';

part 'diary_model_req.g.dart';

@freezed
class DiaryModelReq with _$DiaryModelReq {
  const factory DiaryModelReq({
    required int diaryVolumeSeq,
    required int userSeq,
    int? diarySeq,
    required String dateTime,
    required String bodyText,
    @Default('감정') String emotion,
    @Default('날씨') String weather,
    required DiaryResource diaryResource,
    required DiaryGps diaryGps,
  }) = _DiaryModelReq;

  factory DiaryModelReq.fromJson(Map<String, Object?> json) =>
      _$DiaryModelReqFromJson(json);
}

@freezed
class DiaryResource with _$DiaryResource {
  const factory DiaryResource({
    required String imgUrl,
  }) = _DiaryResource;

  factory DiaryResource.fromJson(Map<String, Object?> json) =>
      _$DiaryResourceFromJson(json);
}

@freezed
class DiaryGps with _$DiaryGps {
  const factory DiaryGps({
    required String name,
    @Default('') String? fsqId,
    @Default('') String? address,
    @Default('') String? country,
    @Default('') String? locality,
    @Default('') String? postTown,
    @Default('') String? postCode,
    @Default('') String? region,
    Geocode? geocode,
    List<Category>? categoryList,
  }) = _DiaryGps;

  factory DiaryGps.fromJson(Map<String, Object?> json) =>
      _$DiaryGpsFromJson(json);
}

@freezed
class Geocode with _$Geocode {
  const factory Geocode({
    @Default(0.0) double? latitude,
    @Default(0.0) double? longitude,
  }) = _Geocode;

  factory Geocode.fromJson(Map<String, Object?> json) =>
      _$GeocodeFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    @Default('') String? fsqId,
    @Default('') String? id,
    @Default('') String? name,
    @Default('') String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
