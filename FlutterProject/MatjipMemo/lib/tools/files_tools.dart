import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;


class FilesTools {
  static Future<FileModel> downloadFile(String url, String fileName) async{
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return FileModel(filePath: filePath, file: file);
  }
}
class FileModel{
  File? file;
  String? filePath;
  FileModel({required this.file, required this.filePath});
}