// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_model_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VolumeModelRes _$$_VolumeModelResFromJson(Map<String, dynamic> json) =>
    _$_VolumeModelRes(
      diaryVolumeSeq: json['diaryVolumeSeq'] as int?,
      creatorSeq: json['creatorSeq'] as int?,
      memberList: (json['memberList'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupingWriteDate: json['groupingWriteDate'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_VolumeModelResToJson(_$_VolumeModelRes instance) =>
    <String, dynamic>{
      'diaryVolumeSeq': instance.diaryVolumeSeq,
      'creatorSeq': instance.creatorSeq,
      'memberList': instance.memberList,
      'groupingWriteDate': instance.groupingWriteDate,
    };

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      userSeq: json['userSeq'] as int?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'userSeq': instance.userSeq,
      'role': instance.role,
    };
