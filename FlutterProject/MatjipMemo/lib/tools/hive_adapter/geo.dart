import 'package:hive/hive.dart';
import 'package:matjipmemo/models/base/geo.dart';

class GeoAdapter extends TypeAdapter<Geo> {
  @override
  int get typeId => 4;

  @override
  Geo read(BinaryReader reader) {
    final Map<String, dynamic> micros = Map<String, dynamic>.from(reader.readMap());
    return Geo.fromJson(micros);
  }

  @override
  void write(BinaryWriter writer, Geo obj) {
    writer.writeMap(obj.toJson());
  }
}
