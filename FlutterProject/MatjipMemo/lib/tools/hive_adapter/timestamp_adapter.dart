import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class TimestampAdapter extends TypeAdapter<Timestamp> {
  @override
  int get typeId => 8;

  @override
  Timestamp read(BinaryReader reader) {
    final micros = reader.readInt();
    return Timestamp.fromMillisecondsSinceEpoch(micros);
  }

  @override
  void write(BinaryWriter writer, Timestamp obj) {
    writer.writeInt(obj.millisecondsSinceEpoch);
  }
}
