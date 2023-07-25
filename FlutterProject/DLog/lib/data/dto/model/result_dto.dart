import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_dto.freezed.dart';
part 'result_dto.g.dart';

@freezed
class ResultDto with _$ResultDto {
  const factory ResultDto({
    required String? code,
    required String? message,
  }) = _ResultDto;

  factory ResultDto.fromJson(Map<String, Object?> json) =>
      _$ResultDtoFromJson(json);
}