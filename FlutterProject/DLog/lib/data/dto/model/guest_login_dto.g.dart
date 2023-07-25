// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuestLoginDto _$$_GuestLoginDtoFromJson(Map<String, dynamic> json) =>
    _$_GuestLoginDto(
      data: json['data'] == null
          ? null
          : UserModelDto.fromJson(json['data'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : ResultDto.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GuestLoginDtoToJson(_$_GuestLoginDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'result': instance.result,
    };
