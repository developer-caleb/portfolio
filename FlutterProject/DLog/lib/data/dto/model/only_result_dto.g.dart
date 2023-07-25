// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'only_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OnlyResultDto _$$_OnlyResultDtoFromJson(Map<String, dynamic> json) =>
    _$_OnlyResultDto(
      result: json['result'] == null
          ? null
          : ResultDto.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OnlyResultDtoToJson(_$_OnlyResultDto instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
