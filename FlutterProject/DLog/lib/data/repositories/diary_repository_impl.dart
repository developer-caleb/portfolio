import 'dart:io';

import 'package:intl/intl.dart';
import 'package:locationdiary/data/models/request/delete_diary_req.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:minio/io.dart';
import 'package:minio/minio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:locationdiary/data/datasources/http_client.dart';
import 'package:locationdiary/data/models/request/diary_model_req.dart';
import 'package:locationdiary/data/models/response/get_diaries_res.dart';
import 'package:locationdiary/data/models/response/get_volumes_res.dart';
import 'package:locationdiary/data/models/response/common_res.dart';
import 'package:locationdiary/domain/repository/diary_repository.dart';
import 'package:locationdiary/domain/repository/get_storages.dart';

 get userSeq => getStorageBox.read(GetStorageKey.keyMyUserSeq).toString();

class DiaryRepositoryImpl extends DiaryRepository {
  @override
  Future<CommonRes> saveDiary({
    required int diaryVolumeSeq,
    required String dateTime,
    required String bodyText,
    required String imgUrl,
    required String placeName,
  }) async {
    return await HttpClient.diaryApi.saveDiary(
      int.parse(userSeq),
      DiaryModelReq(
        userSeq: int.parse(userSeq),
        diaryVolumeSeq: diaryVolumeSeq,
        dateTime: dateTime,
        bodyText: bodyText,
        diaryResource: DiaryResource(
          imgUrl: imgUrl,
        ),
        diaryGps: DiaryGps(
          name: placeName,
          fsqId: '',
          geocode: Geocode(latitude: 0.0, longitude: 0.0),
          categoryList: [
            Category(
              id: '',
              name: '',
              icon: '',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<GetDiariesRes> getDiaries({
    required int diaryVolumeSeq,
    required String writeDate,
  }) async {
    return await HttpClient.diaryApi.getDiaries(
      int.parse(userSeq),
      diaryVolumeSeq,
      writeDate,
    );
  }

  @override
  Future<GetVolumesRes> getVolumes() async {
    return await HttpClient.diaryApi.getVolumes(
      int.parse(userSeq),
    );
  }

  @override
  Future<CommonRes> deleteDiary({
    required int diarySeq,
    required int diaryVolumeSeq,
  }) async {
    return await HttpClient.diaryApi.deleteDiary(
      int.parse(userSeq),
      DeleteDiaryReq(
        userSeq: int.parse(userSeq),
        diarySeq: diarySeq,
        diaryVolumeSeq: diaryVolumeSeq,
      ),
    );
  }

  @override
  Future<CommonRes> amendDiary({
    int? diarySeq,
    required int diaryVolumeSeq,
    required String dateTime,
    required String bodyText,
    required String imgUrl,
    required String placeName,
  }) async {
    return await HttpClient.diaryApi.amendDiary(
      int.parse(userSeq),
      DiaryModelReq(
        diarySeq: diarySeq,
        userSeq: int.parse(userSeq),
        diaryVolumeSeq: diaryVolumeSeq,
        dateTime: dateTime,
        bodyText: bodyText,
        diaryResource: DiaryResource(
          imgUrl: imgUrl,
        ),
        diaryGps: DiaryGps(
          name: placeName,
          fsqId: '',
          geocode: Geocode(latitude: 0.0, longitude: 0.0),
          categoryList: [
            Category(
              id: '',
              name: '',
              icon: '',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<File> getImage({
    required String fileName,
    required String directory,
  }) async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    final directoryPath = appDocDirectory.path;

    final imageFile = File('$directoryPath/$fileName');
    if (await imageFile.exists()) return imageFile;

    final minio = Minio(
      endPoint: 'kr.object.ncloudstorage.com',
      accessKey: '4vFMzcUimOk2hwo5xmL9',
      secretKey: 'SyV4yuHBcmeczHfjBPaGU12zOWdM2zAlNVcrdfy1',
    );

    final stream = await minio.getObject('os-diary', '$directory/$fileName');

    return await stream.pipe(File('$directoryPath/$fileName').openWrite());
  }

  @override
  Future<String> saveImage({
    required String imageFilePath,
    required String directory,
  }) async {
    final minio = Minio(
      endPoint: 'kr.object.ncloudstorage.com',
      accessKey: '4vFMzcUimOk2hwo5xmL9',
      secretKey: 'SyV4yuHBcmeczHfjBPaGU12zOWdM2zAlNVcrdfy1',
    );

    /// 파일 이름 (userSeq-dateTime.extension -> 900000000000039-20220715100959.jpg)
    final dateTime = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    final extension = p.extension(imageFilePath);
    final fileName = '$userSeq-$dateTime$extension';

    try {
      await minio.fPutObject('os-diary', '$directory/$fileName', imageFilePath);
    } catch (e) {
      logger.i('예외: $e');
    }

    return fileName;
  }
}
