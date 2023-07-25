import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:matjipmemo/models/firebase/matjip_model.dart';

const KEY_WIDGET_DIRTY = 'dirty_';
const KEY_WIDGET_HEADER = 'header_';
const KEY_WIDGET_MATJIPITEM = 'matjipitem_';
Key generateImgKey() {
  return Key(Timestamp.now().microsecondsSinceEpoch.toString());
}

String generateMatjipKey(
  MatjipModel matjipModel,
  bool my,
) {
  return KEY_WIDGET_MATJIPITEM + my.toString() + matjipModel.matjipId!;
  //맛집마다 내가 만든 맛집이랑 내가 만든 맛집이 아닌 경우 키를 다르게 둬야된다고 생각해서 만들었지만 활용도는 없을 것으로 예상한다
  //왜냐하면 같은 아이디에 하나의 맛집 모델에 대해서 내가 만든 맛집이면서 내가 만들지 않은 맛집인 경우는 존재할 수 없기 때문에
  //키 중복은 발생하지 않을 것이다.
}
