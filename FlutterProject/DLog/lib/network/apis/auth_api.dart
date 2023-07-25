import 'package:dio/dio.dart';
import 'package:locationdiary/data/dto/model/guest_login_dto.dart';
import 'package:locationdiary/data/dto/model/only_result_dto.dart';
import 'package:locationdiary/data/dto/model/user_model.dart';
import 'package:retrofit/http.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/api/auth/signin/guest")
  Future<GuestLoginDto> guestLogin(@Body() UserModel userModel);

  @PUT("/api/member/{userSeq}")
  Future<OnlyResultDto> modifyUserInfo(
      @Path() String userSeq,
      @Body() UserModel userModel);
}


