import 'dart:io';

import 'package:locationdiary/data/models/response/get_diaries_res.dart';
import 'package:locationdiary/data/models/response/get_volumes_res.dart';
import 'package:locationdiary/data/models/response/common_res.dart';

abstract class DiaryRepository {
  Future<CommonRes> saveDiary({
    required int diaryVolumeSeq,
    required String dateTime,
    required String bodyText,
    required String imgUrl,
    required String placeName,
  });

  Future<GetDiariesRes> getDiaries({
    required int diaryVolumeSeq,
    required String writeDate,
  });

  Future<CommonRes> deleteDiary({
    required int diarySeq,
    required int diaryVolumeSeq,
  });

  Future<CommonRes> amendDiary({
    int? diarySeq,
    required int diaryVolumeSeq,
    required String dateTime,
    required String bodyText,
    required String imgUrl,
    required String placeName,
  });

  Future<GetVolumesRes> getVolumes();

  Future<String> saveImage({
    required String imageFilePath,
    required String directory,
  });

  Future<File> getImage({
    required String fileName,
    required String directory,
  });
}
