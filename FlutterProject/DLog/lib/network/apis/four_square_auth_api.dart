import 'package:dio/dio.dart';
import 'package:locationdiary/data/dto/model/four_square_response_dto.dart';
import 'package:locationdiary/network/four_square_client.dart';
import 'package:retrofit/retrofit.dart';

part 'four_square_auth_api.g.dart';

@RestApi()
abstract class FourSquareAuthApi {
  factory FourSquareAuthApi(Dio dio, {String baseUrl}) = _FourSquareAuthApi;

  @GET("venues/search$fourSquareApiVersion$fourSquareClientId$fourSquareClientSecret")
  Future<FourSquareResponseDto> getSearch(
    @Query("ll") String latitudeLongitude);
}