import 'package:freezed_annotation/freezed_annotation.dart';

import '../firebase/point_model.dart';

part 'point_noti_dto.freezed.dart';
part 'point_noti_dto.g.dart';

@freezed
class PointNotiDTO with _$PointNotiDTO {
  factory PointNotiDTO.xp({
    required String uid,
    required PointModel point,
    required String description,
    required String routes,
    required String type,
    @Default('xp') String pointClass,
  }) = _PointNotiDTOXp;

  factory PointNotiDTO.gold({
    required String uid,
    required PointModel point,
    required String description,
    required String routes,
    required String type,
    @Default('gold') String pointClass,
  }) = _PointNotiDTOGold;

  factory PointNotiDTO.diamond({
    required String uid,
    required PointModel point,
    required String description,
    required String routes,
    required String type,
    @Default('gold') String pointClass,
  }) = _PointNotiDTODiamond;

  factory PointNotiDTO.fromJson(Map<String, dynamic> json) => _$PointNotiDTOFromJson(json);
}
