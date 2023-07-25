// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'writer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Writer _$$_WriterFromJson(Map<String, dynamic> json) => _$_Writer(
      img: json['writerimg'] as String? ?? '',
      uid: json['makeruid'] as String? ?? '',
      name: json['makername'] as String? ?? '',
      followers: json['maker_followers'] as List<dynamic>? ?? const [],
      private: json['writerprivate'] as bool? ?? false,
      banned: json['writer_banned'] as bool? ?? false,
      locationCode: json['user_location_code'] as String?,
      languageCode: json['user_language_code'] as String?,
      isImgCircle: json['isWriterImgCircle'] as bool? ?? true,
      backgroundColor: json['writerBackgroundColor'] as int? ?? 4294967295,
    );

Map<String, dynamic> _$$_WriterToJson(_$_Writer instance) => <String, dynamic>{
      'writerimg': instance.img,
      'makeruid': instance.uid,
      'makername': instance.name,
      'maker_followers': instance.followers,
      'writerprivate': instance.private,
      'writer_banned': instance.banned,
      'user_location_code': instance.locationCode,
      'user_language_code': instance.languageCode,
      'isWriterImgCircle': instance.isImgCircle,
      'writerBackgroundColor': instance.backgroundColor,
    };
