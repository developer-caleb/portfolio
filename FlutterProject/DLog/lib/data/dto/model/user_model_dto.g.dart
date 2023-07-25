// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModelDto _$$_UserModelDtoFromJson(Map<String, dynamic> json) =>
    _$_UserModelDto(
      userNickname: json['userNickname'] as String?,
      userProfileImgUrl: json['userProfileImgUrl'] as String?,
      grantType: json['grantType'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userSeq: json['userSeq'] as int?,
    );

Map<String, dynamic> _$$_UserModelDtoToJson(_$_UserModelDto instance) =>
    <String, dynamic>{
      'userNickname': instance.userNickname,
      'userProfileImgUrl': instance.userProfileImgUrl,
      'grantType': instance.grantType,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userSeq': instance.userSeq,
    };
