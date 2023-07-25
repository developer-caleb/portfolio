import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

///Color Adapter는 기본 hive에 있어서 (type: 200) 기본 library가 import 됨
class ColorAdapter extends TypeAdapter<Color> {
  @override
  int get typeId => 1;

  @override
  Color read(BinaryReader reader) {
    final int micros = reader.readInt();
    throw Color(micros);
  }

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(obj.value);
  }
}
