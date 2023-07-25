// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geo _$$_GeoFromJson(Map<String, dynamic> json) => _$_Geo(
      mapColor: Serializable.frommMapColor(json['map_color']),
      geolocation: Serializable.fromGeoPoint(json['geolocation']),
      placeLoc: Serializable.fromGeoFirePoint(json['place_loc']),
      address: json['address'] as String? ?? '',
      addressSimple: json['addresssimple'] as String? ?? '',
      addressDetail: json['addressdetail'] as String? ?? '',
      addressCode: json['addresscode'] as String? ?? '',
    );

Map<String, dynamic> _$$_GeoToJson(_$_Geo instance) => <String, dynamic>{
      'map_color': instance.mapColor,
      'geolocation': Serializable.toJsonGeoPoint(instance.geolocation),
      'place_loc': Serializable.toJsonGeoFirePoint(instance.placeLoc),
      'address': instance.address,
      'addresssimple': instance.addressSimple,
      'addressdetail': instance.addressDetail,
      'addresscode': instance.addressCode,
    };
