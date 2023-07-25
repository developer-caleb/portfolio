import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:locationdiary/domain/repository/get_storages.dart';
import 'package:locationdiary/data/datasources/diary_api.dart';

const String baseUrl = "http://175.45.195.22/diary/api";


final prettyDioLogger = PrettyDioLogger(
  requestHeader: true,
  requestBody: true,
  responseBody: true,
  responseHeader: false,
  error: true,
  compact: true,
  maxWidth: 90,
);

class HttpClient {
  static BaseOptions options = BaseOptions(
    contentType: Headers.jsonContentType,
    headers: {
      "Authorization":
          "Bearer ${getStorageBox.read(GetStorageKey.keyMyAccessToken)}",
    },
  );

  static Dio dio = Dio(options)
    ..interceptors.addAll([
      prettyDioLogger,
    ]);

  static DiaryApi get diaryApi => DiaryApi(dio, baseUrl: '$baseUrl/diary');
}
