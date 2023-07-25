// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryModelRes _$$_DiaryModelResFromJson(Map<String, dynamic> json) =>
    _$_DiaryModelRes(
      diarySeq: json['diarySeq'] as int,
      userSeq: json['userSeq'] as int,
      dateTime: json['dateTime'] as String,
      bodyText: json['bodyText'] as String,
      emotion: json['emotion'] as String,
      weather: json['weather'] as String,
      diaryResource: json['diaryResource'] == null
          ? null
          : DiaryResource.fromJson(
              json['diaryResource'] as Map<String, dynamic>),
      diaryGps: json['diaryGps'] == null
          ? null
          : DiaryGps.fromJson(json['diaryGps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DiaryModelResToJson(_$_DiaryModelRes instance) =>
    <String, dynamic>{
      'diarySeq': instance.diarySeq,
      'userSeq': instance.userSeq,
      'dateTime': instance.dateTime,
      'bodyText': instance.bodyText,
      'emotion': instance.emotion,
      'weather': instance.weather,
      'diaryResource': instance.diaryResource,
      'diaryGps': instance.diaryGps,
    };

_$_DiaryResource _$$_DiaryResourceFromJson(Map<String, dynamic> json) =>
    _$_DiaryResource(
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$$_DiaryResourceToJson(_$_DiaryResource instance) =>
    <String, dynamic>{
      'imgUrl': instance.imgUrl,
    };

_$_DiaryGps _$$_DiaryGpsFromJson(Map<String, dynamic> json) => _$_DiaryGps(
      name: json['name'] as String,
      fsqId: json['fsqId'] as String? ?? '',
      geocode: json['geocode'] == null
          ? null
          : Geocode.fromJson(json['geocode'] as Map<String, dynamic>),
      categoryList: (json['categoryList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DiaryGpsToJson(_$_DiaryGps instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fsqId': instance.fsqId,
      'geocode': instance.geocode,
      'categoryList': instance.categoryList,
    };

_$_Geocode _$$_GeocodeFromJson(Map<String, dynamic> json) => _$_Geocode(
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_GeocodeToJson(_$_Geocode instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
