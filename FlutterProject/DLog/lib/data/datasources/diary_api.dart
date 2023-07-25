import 'package:dio/dio.dart';
import 'package:locationdiary/data/models/request/delete_diary_req.dart';
import 'package:retrofit/retrofit.dart';

import 'package:locationdiary/data/models/request/diary_model_req.dart';
import 'package:locationdiary/data/models/response/get_diaries_res.dart';
import 'package:locationdiary/data/models/response/get_volumes_res.dart';
import 'package:locationdiary/data/models/response/common_res.dart';

part 'diary_api.g.dart';

@RestApi()
abstract class DiaryApi {
  factory DiaryApi(Dio dio, {String baseUrl}) = _DiaryApi;

  /// 일기 작성
  @POST("/{userSeq}")
  Future<CommonRes> saveDiary(
    @Path('userSeq') num userSeq,
    @Body() DiaryModelReq diaryModelReq,
  );

  /// 일기 조회
  @GET("/{userSeq}")
  Future<GetDiariesRes> getDiaries(
    @Path('userSeq') num userSeq,
    @Query('diaryVolumeSeq') num diaryVolumeSeq,
    @Query('writeDate') String writeDate,
  );

  /// 사용자 일기장 그룹 조회
  @GET("/volume/{userSeq}")
  Future<GetVolumesRes> getVolumes(
    @Path('userSeq') num userSeq,
  );

  /// 일기 삭제
  @DELETE("/{userSeq}")
  Future<CommonRes> deleteDiary(
    @Path('userSeq') num userSeq,
    @Body() DeleteDiaryReq deleteDiaryReq,
  );

  /// 일기 수정
  @PUT("/{userSeq}")
  Future<CommonRes> amendDiary(
    @Path('userSeq') num userSeq,
    @Body() DiaryModelReq diaryModelReq,
  );
}
