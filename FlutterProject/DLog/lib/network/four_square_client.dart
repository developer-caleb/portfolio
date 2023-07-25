import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'apis/four_square_auth_api.dart';

const String fourSquareBaseUrl = "https://api.foursquare.com/v2/";
const fourSquareClientId = '&client_id=1YC5GC1TKQRWE5LE3A24UZ1U30AU3FNB5ZQWKCCBY0P351WE';
const fourSquareClientSecret = '&client_secret=ERB34YOVXQFVIOFSCIPKQDYOKUZZI2YYZYFOV5TYELC3YVNY';
const fourSquareApiVersion = '?v=20190101';


final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90);

class FourSquareHttpClient {
  static FourSquareAuthApi get fourSquareAuthApi {
    final dio = Dio();
    dio.interceptors.add(_prettyDioLogger);
    final api = FourSquareAuthApi(dio, baseUrl: fourSquareBaseUrl);
    return api;
  }
}