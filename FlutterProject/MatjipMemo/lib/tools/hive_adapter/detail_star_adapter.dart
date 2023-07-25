import 'package:hive/hive.dart';
import 'package:matjipmemo/models/dto/detail_star_model.dart';

class DetailStarAdapter extends TypeAdapter<DetailStarModel?> {
  @override
  int get typeId => 2;

  @override
  read(BinaryReader reader) {
    final Map<String, dynamic> micros = Map<String, dynamic>.from(reader.readMap());
    return DetailStarModel.fromJson(micros);
  }

  @override
  void write(BinaryWriter writer, DetailStarModel? obj) {
    writer.writeMap(obj?.toJson() ?? {});
  }
}
