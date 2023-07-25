import 'package:locationdiary/data/models/response/get_volumes_res.dart';
import 'package:locationdiary/domain/repository/diary_repository.dart';

class GetVolumesUseCase {
  final DiaryRepository _diaryRepository;

  GetVolumesUseCase(this._diaryRepository);

  Future<GetVolumesRes> call() {
    return _diaryRepository.getVolumes();
  }
}
