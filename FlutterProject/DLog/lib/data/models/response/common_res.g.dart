// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommonRes _$$_CommonResFromJson(Map<String, dynamic> json) => _$_CommonRes(
      result: json['result'] == null
          ? null
          : ResultDto.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommonResToJson(_$_CommonRes instance) =>
    <String, dynamic>{
      'result': instance.result,
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
