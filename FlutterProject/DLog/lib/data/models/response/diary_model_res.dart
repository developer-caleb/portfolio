import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_model_res.freezed.dart';

part 'diary_model_res.g.dart';

@freezed
class DiaryModelRes with _$DiaryModelRes {
  const factory DiaryModelRes({
    required int diarySeq,
    required int userSeq,
    required String dateTime,
    required String bodyText,
    required String emotion,
    required String weather,
    DiaryResource? diaryResource,
    DiaryGps? diaryGps,
  }) = _DiaryModelRes;

  factory DiaryModelRes.fromJson(Map<String, Object?> json) =>
      _$DiaryModelResFromJson(json);
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
    @Default('') String? id,
    @Default('') String? name,
    @Default('') String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, Object?> json) =>
      _$CategoryFromJson(json);
}
