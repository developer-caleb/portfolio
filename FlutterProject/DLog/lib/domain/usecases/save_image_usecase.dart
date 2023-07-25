import 'package:locationdiary/domain/repository/diary_repository.dart';

class SaveImageUseCase {
  final DiaryRepository _diaryRepository;

  SaveImageUseCase(this._diaryRepository);

  Future<String> call({
    required String imageFilePath,
    String directory = 'diary',
  }) {
    return _diaryRepository.saveImage(
      imageFilePath: imageFilePath,
      directory: directory,
    );
  }
}
