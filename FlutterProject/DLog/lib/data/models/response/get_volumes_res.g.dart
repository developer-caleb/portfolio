// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_volumes_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetVolumesRes _$$_GetVolumesResFromJson(Map<String, dynamic> json) =>
    _$_GetVolumesRes(
      data: json['data'] == null
          ? null
          : DataDto.fromJson(json['data'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : ResultDto.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GetVolumesResToJson(_$_GetVolumesRes instance) =>
    <String, dynamic>{
      'data': instance.data,
      'result': instance.result,
    };

_$_DataDto _$$_DataDtoFromJson(Map<String, dynamic> json) => _$_DataDto(
      total: json['total'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => VolumeModelRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DataDtoToJson(_$_DataDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
    };

_$_ResultDto _$$_ResultDtoFromJson(Map<String, dynamic> json) => _$_ResultDto(
      code: json['code'] as String?,
      message: json['message'] as String?,
      errorList: (json['errorList'] as List<dynamic>?)
          ?.map((e) => ErrorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResultDtoToJson(_$_ResultDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'errorList': instance.errorList,
    };

_$_ErrorDto _$$_ErrorDtoFromJson(Map<String, dynamic> json) => _$_ErrorDto(
      field: json['field'] as String?,
      value: json['value'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$_ErrorDtoToJson(_$_ErrorDto instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
      'reason': instance.reason,
    };
