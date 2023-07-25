import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

class DocRefAdapter extends TypeAdapter<DocumentReference> {
  @override
  int get typeId => 3;

  @override
  DocumentReference<Object?> read(BinaryReader reader) {
    final String micros = reader.readString();
    return FirebaseFirestore.instance.doc(micros);
  }

  @override
  void write(BinaryWriter writer, DocumentReference<Object?> obj) {
    writer.writeString(obj.path);
  }
}
