// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_square_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FourSquareLocationDto _$$_FourSquareLocationDtoFromJson(
        Map<String, dynamic> json) =>
    _$_FourSquareLocationDto(
      address: json['address'] as String?,
      crossStreet: json['crossStreet'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      labeledLatLngs: (json['labeledLatLngs'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      distance: (json['distance'] as num?)?.toDouble(),
      postalCode: json['postalCode'] as String?,
      cc: json['cc'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      formattedAddress: (json['formattedAddress'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_FourSquareLocationDtoToJson(
        _$_FourSquareLocationDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'crossStreet': instance.crossStreet,
      'lat': instance.lat,
      'lng': instance.lng,
      'labeledLatLngs': instance.labeledLatLngs,
      'distance': instance.distance,
      'postalCode': instance.postalCode,
      'cc': instance.cc,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'formattedAddress': instance.formattedAddress,
    };
