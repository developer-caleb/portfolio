import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:locationdiary/data/models/response/common_res.dart';
import 'package:locationdiary/data/models/response/get_volumes_res.dart';
import 'package:locationdiary/data/repositories/diary_repository_impl.dart';
import 'package:locationdiary/domain/usecases/amend_diary_usecase.dart';
import 'package:locationdiary/domain/usecases/get_volumes_usecase.dart';
import 'package:locationdiary/domain/usecases/save_diary_usecase.dart';
import 'package:locationdiary/domain/usecases/save_image_usecase.dart';
import 'package:locationdiary/utils/logger.dart';

class PostController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  File? _imageFile;

  File? get imageFile => _imageFile;

  void setImageFile(File? imageFile) {
    _imageFile = imageFile;
  }

  void selectImage() async {
    var preImageFile = await _picker.pickImage(source: ImageSource.gallery);
    _imageFile = preImageFile != null ? File(preImageFile.path) : null;
    update();
  }

  void cancelImage() {
    _imageFile = null;
    update();
  }

  Future<CommonRes> saveDiary({
    required String dateTime,
    required String bodyText,
    required String placeName,
  }) async {
    SaveDiaryUseCase saveDiaryUseCase = SaveDiaryUseCase(DiaryRepositoryImpl());
    SaveImageUseCase saveImageUseCase = SaveImageUseCase(DiaryRepositoryImpl());

    final volumes = await _getVolumes();
    final diaryVolumeSeq = volumes.data!.list![0].diaryVolumeSeq;

    String imgUrl = '';
    if (_imageFile != null) {
      imgUrl = await saveImageUseCase(imageFilePath: _imageFile!.path);
    }

    final res = await saveDiaryUseCase(
      diaryVolumeSeq: diaryVolumeSeq!,
      dateTime: dateTime,
      bodyText: bodyText,
      imgUrl: imgUrl,
      placeName: placeName,
    );

    return res;
  }

  Future<CommonRes> amendDiary({
    int? diarySeq,
    required String dateTime,
    required String bodyText,
    required String placeName,
  }) async {
    AmendDiaryUseCase amendDiaryUseCase = AmendDiaryUseCase(DiaryRepositoryImpl());
    SaveImageUseCase saveImageUseCase = SaveImageUseCase(DiaryRepositoryImpl());

    final volumes = await _getVolumes();
    final diaryVolumeSeq = volumes.data!.list![0].diaryVolumeSeq;

    String imgUrl = '';
    if (_imageFile != null) {
      imgUrl = await saveImageUseCase(imageFilePath: _imageFile!.path);
    }

    final res =  await amendDiaryUseCase(
      diarySeq: diarySeq,
      diaryVolumeSeq: diaryVolumeSeq!,
      dateTime: dateTime,
      bodyText: bodyText,
      imgUrl: imgUrl,
      placeName: placeName,
    );

    logger.i('res: $res');

    return res;
  }

  Future<GetVolumesRes> _getVolumes() async {
    GetVolumesUseCase getVolumesUseCase =
        GetVolumesUseCase(DiaryRepositoryImpl());

    return await getVolumesUseCase();
  }
}
