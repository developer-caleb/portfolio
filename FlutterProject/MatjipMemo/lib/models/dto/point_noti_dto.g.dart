// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_noti_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointNotiDTOXp _$$_PointNotiDTOXpFromJson(Map<String, dynamic> json) =>
    _$_PointNotiDTOXp(
      uid: json['uid'] as String,
      point: PointModel.fromJson(json['point'] as Map<String, dynamic>),
      description: json['description'] as String,
      routes: json['routes'] as String,
      type: json['type'] as String,
      pointClass: json['pointClass'] as String? ?? 'xp',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_PointNotiDTOXpToJson(_$_PointNotiDTOXp instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'point': instance.point,
      'description': instance.description,
      'routes': instance.routes,
      'type': instance.type,
      'pointClass': instance.pointClass,
      'runtimeType': instance.$type,
    };

_$_PointNotiDTOGold _$$_PointNotiDTOGoldFromJson(Map<String, dynamic> json) =>
    _$_PointNotiDTOGold(
      uid: json['uid'] as String,
      point: PointModel.fromJson(json['point'] as Map<String, dynamic>),
      description: json['description'] as String,
      routes: json['routes'] as String,
      type: json['type'] as String,
      pointClass: json['pointClass'] as String? ?? 'gold',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_PointNotiDTOGoldToJson(_$_PointNotiDTOGold instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'point': instance.point,
      'description': instance.description,
      'routes': instance.routes,
      'type': instance.type,
      'pointClass': instance.pointClass,
      'runtimeType': instance.$type,
    };

_$_PointNotiDTODiamond _$$_PointNotiDTODiamondFromJson(
        Map<String, dynamic> json) =>
    _$_PointNotiDTODiamond(
      uid: json['uid'] as String,
      point: PointModel.fromJson(json['point'] as Map<String, dynamic>),
      description: json['description'] as String,
      routes: json['routes'] as String,
      type: json['type'] as String,
      pointClass: json['pointClass'] as String? ?? 'gold',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_PointNotiDTODiamondToJson(
        _$_PointNotiDTODiamond instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'point': instance.point,
      'description': instance.description,
      'routes': instance.routes,
      'type': instance.type,
      'pointClass': instance.pointClass,
      'runtimeType': instance.$type,
    };
