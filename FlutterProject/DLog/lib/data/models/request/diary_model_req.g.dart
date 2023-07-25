// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_model_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiaryModelReq _$$_DiaryModelReqFromJson(Map<String, dynamic> json) =>
    _$_DiaryModelReq(
      diaryVolumeSeq: json['diaryVolumeSeq'] as int,
      userSeq: json['userSeq'] as int,
      diarySeq: json['diarySeq'] as int?,
      dateTime: json['dateTime'] as String,
      bodyText: json['bodyText'] as String,
      emotion: json['emotion'] as String? ?? '감정',
      weather: json['weather'] as String? ?? '날씨',
      diaryResource:
          DiaryResource.fromJson(json['diaryResource'] as Map<String, dynamic>),
      diaryGps: DiaryGps.fromJson(json['diaryGps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DiaryModelReqToJson(_$_DiaryModelReq instance) =>
    <String, dynamic>{
      'diaryVolumeSeq': instance.diaryVolumeSeq,
      'userSeq': instance.userSeq,
      'diarySeq': instance.diarySeq,
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
      address: json['address'] as String? ?? '',
      country: json['country'] as String? ?? '',
      locality: json['locality'] as String? ?? '',
      postTown: json['postTown'] as String? ?? '',
      postCode: json['postCode'] as String? ?? '',
      region: json['region'] as String? ?? '',
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
      'address': instance.address,
      'country': instance.country,
      'locality': instance.locality,
      'postTown': instance.postTown,
      'postCode': instance.postCode,
      'region': instance.region,
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
      fsqId: json['fsqId'] as String? ?? '',
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'fsqId': instance.fsqId,
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
