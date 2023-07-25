// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Places _$$_PlacesFromJson(Map<String, dynamic> json) => _$_Places(
      placeId: json['placeid'] as String? ?? '',
      matjipName: json['matjipname'] as String? ?? '',
      categoryName: json['category_name'] as String? ?? '',
      imageUrls: json['imageurls'] as List<dynamic>? ?? const [],
      thumbnailImageUrls: json['thumbnailimageurls'] as List<dynamic>? ?? const [],
      tags: json['tags'] as List<dynamic>? ?? const [],
      listOfLikes: json['listoflikes'] as List<dynamic>? ?? const [],
      listOfReview: json['listOfReview'] as List<dynamic>? ?? const [],
      locationCode: json['user_location_code'] as String?,
      kakaoUrl: json['kakao_url'] as String?,
      supplyCompany: json['supply_company'] as String?,
      phone: json['phone'] as String?,
      kakaoId: json['kakao_id'] as String?,
      orderCategory: json['order_category'] as String?,
      categoryGroupName: json['category_group_name'] as String?,
      isMatjip: json['isMatjip'] as bool?,
      countChild: json['count_child'] as num? ?? 0,
      orderPoint: json['order_point'] == null ? 0 : Serializable.fromDouble(json['order_point']),
      starAvg: json['star_avg'] as num? ?? 0,
    );

Map<String, dynamic> _$$_PlacesToJson(_$_Places instance) => <String, dynamic>{
      'placeid': instance.placeId,
      'matjipname': instance.matjipName,
      'category_name': instance.categoryName,
      'imageurls': instance.imageUrls,
      'thumbnailimageurls': instance.thumbnailImageUrls,
      'tags': instance.tags,
      'listoflikes': instance.listOfLikes,
      'listOfReview': instance.listOfReview,
      'user_location_code': instance.locationCode,
      'kakao_url': instance.kakaoUrl,
      'supply_company': instance.supplyCompany,
      'phone': instance.phone,
      'kakao_id': instance.kakaoId,
      'order_category': instance.orderCategory,
      'category_group_name': instance.categoryGroupName,
      'isMatjip': instance.isMatjip,
      'count_child': instance.countChild,
      'order_point': instance.orderPoint,
      'star_avg': instance.starAvg,
    };
