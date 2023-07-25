// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'four_square_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FourSquareCategoryDto _$$_FourSquareCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_FourSquareCategoryDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      pluralName: json['pluralName'] as String?,
      shortName: json['shortName'] as String?,
      icon: json['icon'] as Map<String, dynamic>?,
      primary: json['primary'] as bool?,
    );

Map<String, dynamic> _$$_FourSquareCategoryDtoToJson(
        _$_FourSquareCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pluralName': instance.pluralName,
      'shortName': instance.shortName,
      'icon': instance.icon,
      'primary': instance.primary,
    };
