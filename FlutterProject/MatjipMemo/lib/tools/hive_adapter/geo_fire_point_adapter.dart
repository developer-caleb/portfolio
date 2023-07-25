import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:hive/hive.dart';

class GeoFirePointAdapter extends TypeAdapter<GeoFirePoint> {
  @override
  int get typeId => 5;

  @override
  GeoFirePoint read(BinaryReader reader) {
    final Map micros = reader.readMap();
    return GeoFirePoint(micros['lat'] ?? 0, micros['lng'] ?? 0);
  }

  @override
  void write(BinaryWriter writer, GeoFirePoint obj) {
    writer.writeMap({'lat': obj.latitude, 'lng': obj.longitude});
  }
}
