// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String,
      userNickname: json['userNickname'] as String?,
      userProfileImgUrl: json['userProfileImgUrl'] as String?,
      authTypeCode: json['authTypeCode'] as String?,
      userSeq: json['userSeq'] as int?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userNickname': instance.userNickname,
      'userProfileImgUrl': instance.userProfileImgUrl,
      'authTypeCode': instance.authTypeCode,
      'userSeq': instance.userSeq,
    };
