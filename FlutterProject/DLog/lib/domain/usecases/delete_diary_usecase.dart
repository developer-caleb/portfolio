import 'package:locationdiary/data/models/response/common_res.dart';
import 'package:locationdiary/domain/repository/diary_repository.dart';

class DeleteDiaryUseCase {
  final DiaryRepository _diaryRepository;

  DeleteDiaryUseCase(this._diaryRepository);

  Future<CommonRes> call({
    required int diarySeq,
    required int diaryVolumeSeq,
  }) {
    return _diaryRepository.deleteDiary(
      diarySeq: diarySeq,
      diaryVolumeSeq: diaryVolumeSeq,
    );
  }
}
