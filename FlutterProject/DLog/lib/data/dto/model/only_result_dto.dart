import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locationdiary/data/dto/model/result_dto.dart';

part 'only_result_dto.freezed.dart';
part 'only_result_dto.g.dart';

@freezed
class OnlyResultDto with _$OnlyResultDto {
  const factory OnlyResultDto({
    required ResultDto? result,
  }) = _OnlyResultDto;
  factory OnlyResultDto.fromJson(Map<String, Object?> json) =>
      _$OnlyResultDtoFromJson(json);
}
