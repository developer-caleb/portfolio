import 'package:locationdiary/data/models/response/common_res.dart';
import 'package:locationdiary/domain/repository/diary_repository.dart';

class SaveDiaryUseCase {
  final DiaryRepository _diaryRepository;

  SaveDiaryUseCase(this._diaryRepository);

  Future<CommonRes> call({
    required int diaryVolumeSeq,
    required String dateTime,
    required String bodyText,
    required String imgUrl,
    required String placeName,
  }) {
    return _diaryRepository.saveDiary(
      diaryVolumeSeq: diaryVolumeSeq,
      dateTime: dateTime,
      bodyText: bodyText,
      imgUrl: imgUrl,
      placeName: placeName,
    );
  }
}
