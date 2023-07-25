import 'package:hive/hive.dart';
import 'package:matjipmemo/models/base/writer.dart';

class WriterAdapter extends TypeAdapter<Writer> {
  @override
  int get typeId => 9;

  @override
  read(BinaryReader reader) {
    final Map<String, dynamic> micros = Map<String, dynamic>.from(reader.readMap());
    return Writer.fromJson(micros);
  }

  @override
  void write(BinaryWriter writer, Writer obj) {
    writer.writeMap(obj.toJson());
  }
}
