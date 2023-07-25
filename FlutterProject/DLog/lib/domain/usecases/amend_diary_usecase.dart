import 'package:locationdiary/data/models/response/common_res.dart';
import 'package:locationdiary/domain/repository/diary_repository.dart';

class AmendDiaryUseCase {
  final DiaryRepository _diaryRepository;

  AmendDiaryUseCase(this._diaryRepository);

  Future<CommonRes> call({
    int? diarySeq,
    required int diaryVolumeSeq,
    required String dateTime,
    required String bodyText,
    required String imgUrl,
    required String placeName,
  }) {
    return _diaryRepository.amendDiary(
      diarySeq: diarySeq,
      diaryVolumeSeq: diaryVolumeSeq,
      dateTime: dateTime,
      bodyText: bodyText,
      imgUrl: imgUrl,
      placeName: placeName,
    );
  }
}
