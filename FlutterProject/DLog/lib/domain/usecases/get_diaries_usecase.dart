import 'package:locationdiary/data/models/response/get_diaries_res.dart';
import 'package:locationdiary/domain/repository/diary_repository.dart';

class GetDiariesUseCase {
  final DiaryRepository _diaryRepository;

  GetDiariesUseCase(this._diaryRepository);

  Future<GetDiariesRes> call({
    required int diaryVolumeSeq,
    required String writeDate,
  }) {
    return _diaryRepository.getDiaries(
      diaryVolumeSeq: diaryVolumeSeq,
      writeDate: writeDate,
    );
  }
}
