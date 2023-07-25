import 'package:hive/hive.dart';
import 'package:matjipmemo/models/base/post.dart';

class PostAdapter extends TypeAdapter<Post> {
  @override
  int get typeId => 7;

  @override
  Post read(BinaryReader reader) {
    final Map<String, dynamic> micros = Map<String, dynamic>.from(reader.readMap());
    return Post.fromJson(micros);
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer.writeMap(obj.toJson());
  }
}
