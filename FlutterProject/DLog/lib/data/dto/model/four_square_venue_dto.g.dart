// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_square_venue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FourSquareVenueDto _$$_FourSquareVenueDtoFromJson(
        Map<String, dynamic> json) =>
    _$_FourSquareVenueDto(
      venueId: json['venueId'] as String?,
      name: json['name'] as String?,
      location: json['location'] == null
          ? null
          : FourSquareLocationDto.fromJson(
              json['location'] as Map<String, dynamic>),
      city: json['city'] as String?,
      state: json['state'] as String?,
      cc: json['cc'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map(
              (e) => FourSquareCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FourSquareVenueDtoToJson(
        _$_FourSquareVenueDto instance) =>
    <String, dynamic>{
      'venueId': instance.venueId,
      'name': instance.name,
      'location': instance.location,
      'city': instance.city,
      'state': instance.state,
      'cc': instance.cc,
      'categories': instance.categories,
      'rating': instance.rating,
    };
