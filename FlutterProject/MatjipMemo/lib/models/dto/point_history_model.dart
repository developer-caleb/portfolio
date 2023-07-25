import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/data/repo/helper/serializable.dart';
import 'package:matjipmemo/tools/enums.dart';

import '../firebase/point_model.dart';

class PointHistoryModel {
  Timestamp created;
  PointModel pointModel; //xp : 1 , gold : 1 , diamond :1
  PointType pointType; //linkedmatjip, point받게된 이유
  String actor; //point 받는 사람
  String description; //
  PointClass pointClass; //'xp' 등 포인트 종류
  String routes; //
  PointModel totalPoint;
  DocumentReference reference;

  /// PointNotiDTO와 매우 흡사한형태임 , created, reference빼고는 같음,
  ///그리고 변수명이 몇개 다름, 일단은 따로 사용!
  // required PointModel point,
  // required String type,
  // required String uid,
  // required String description,
  // @Default('xp') String pointClass,
  // required String routes,

  PointHistoryModel(this.created, this.pointModel, this.pointType, this.actor, this.description, this.pointClass, this.totalPoint, this.routes, this.reference);

  PointHistoryModel.fromMap(Map<String, dynamic> map, {required this.reference})
      : created = Serializable.fromTimestamp(map[KEY_CREATED]),
        pointModel = PointModel.fromJson(map),
        actor = map[KEY_ACTOR],
        // totalPoint = map[KEY_TOTAL_POINT] ?? PointModel(),
        totalPoint = PointModel.fromJson(map[KEY_TOTAL_POINT] ?? {}),
        description = map[KEY_DESCRIPTION] ?? '',
        pointClass = PointClass.fromName(map[KEY_POINT_CLASS]),
        routes = map[KEY_ROUTES] is! String ? "" : map[KEY_ROUTES],
        pointType = PointType.fromName(map[KEY_TYPE]);

  PointHistoryModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, //원래 snapshot!.data() 인데 오류떠서 바꿈
            reference: snapshot.reference);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[KEY_CREATED] = created;
    map.addAll(pointModel.toJson());
    map[KEY_TYPE] = pointType.name;
    map[KEY_TOTAL_POINT] = totalPoint.toJson();
    map[KEY_ACTOR] = actor;
    map[KEY_DESCRIPTION] = description;
    map[KEY_POINT_CLASS] = pointClass;
    map[KEY_ROUTES] = routes;
    return map;
  }

  factory PointHistoryModel.createNew({
    required PointModel pointModel,
    required PointType pointType,
    required String actor,
    required String description,
    required PointClass pointClass,
    required PointModel totalPoint,
    required String routes,
  }) {
    Timestamp nowTime = Timestamp.now();
    DocumentReference reference = FirebaseFirestore.instance.collection(COLLECTION_USERS).doc(actor).collection(SUB_COLLECTION_POINT_HISTORY).doc();
    PointHistoryModel newPointHistoryModel = PointHistoryModel(nowTime, pointModel, pointType, actor, description, pointClass, totalPoint, routes, reference);
    return newPointHistoryModel;
  }

  num? toTotalPoint() {
    switch (pointClass) {
      case PointClass.xp:
        return totalPoint.xp;
      case PointClass.diamond:
        return totalPoint.diamond;
      case PointClass.gold:
        return totalPoint.gold;
    }
  }

  num pointNumber() {
    switch (pointClass) {
      case PointClass.xp:
        return pointModel.xp ?? 0;
      case PointClass.diamond:
        return pointModel.diamond ?? 0;
      case PointClass.gold:
        return pointModel.gold ?? 0;
    }
  }

  @override
  String toString() {
    return 'PointHistoryModel{created: $created, pointModel: $pointModel, pointType: $pointType, reference: $reference}';
  }
}
