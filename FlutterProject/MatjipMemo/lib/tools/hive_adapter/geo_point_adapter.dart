import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class GeoPointAdapter extends TypeAdapter<GeoPoint> {
  @override
  int get typeId => 6;

  @override
  GeoPoint read(BinaryReader reader) {
    final Map micros = reader.readMap();
    return GeoPoint(micros['lat'] ?? 0, micros['lng'] ?? 0);
  }

  @override
  void write(BinaryWriter writer, GeoPoint obj) {
    writer.writeMap({'lat': obj.latitude, 'lng': obj.longitude});
  }
}
