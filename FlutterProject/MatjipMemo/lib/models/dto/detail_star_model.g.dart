// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_star_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailStarModel _$$_DetailStarModelFromJson(Map<String, dynamic> json) =>
    _$_DetailStarModel(
      taste: (json['taste'] as num).toDouble(),
      service: (json['service'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      atmosphere: (json['atmosphere'] as num).toDouble(),
      waiting: (json['waiting'] as num).toDouble(),
    );

Map<String, dynamic> _$$_DetailStarModelToJson(_$_DetailStarModel instance) =>
    <String, dynamic>{
      'taste': instance.taste,
      'service': instance.service,
      'price': instance.price,
      'atmosphere': instance.atmosphere,
      'waiting': instance.waiting,
    };
