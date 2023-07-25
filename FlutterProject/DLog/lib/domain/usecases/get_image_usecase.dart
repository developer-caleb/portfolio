import 'dart:io';

import 'package:locationdiary/domain/repository/diary_repository.dart';

class GetImageUseCase {
  final DiaryRepository _diaryRepository;

  GetImageUseCase(this._diaryRepository);

  Future<File> call({
    required String fileName,
    String directory = 'diary',
  }) {
    return _diaryRepository.getImage(
      fileName: fileName,
      directory: directory,
    );
  }
}
