// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      listOfLikes: json['listoflikes'] as List<dynamic>? ?? const [],
      listOfComment: json['listofcomment'] as List<dynamic>? ?? const [],
      countLikes: json['countlikes'] as int? ?? 0,
      countComments: json['countcomments'] as int? ?? 0,
      invisible: json['invisible'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'listoflikes': instance.listOfLikes,
      'listofcomment': instance.listOfComment,
      'countlikes': instance.countLikes,
      'countcomments': instance.countComments,
      'invisible': instance.invisible,
    };
