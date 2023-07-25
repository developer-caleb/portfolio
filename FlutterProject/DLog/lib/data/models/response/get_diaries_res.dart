import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locationdiary/data/models/response/diary_model_res.dart';

part 'get_diaries_res.freezed.dart';

part 'get_diaries_res.g.dart';

@freezed
class GetDiariesRes with _$GetDiariesRes {
  const factory GetDiariesRes({
    DataDto? data,
    ResultDto? result,
  }) = _GetDiariesRes;

  factory GetDiariesRes.fromJson(Map<String, Object?> json) =>
      _$GetDiariesResFromJson(json);
}

@freezed
class DataDto with _$DataDto {
  const factory DataDto({
    int? total,
    List<DiaryModelRes>? list,
  }) = _DataDto;

  factory DataDto.fromJson(Map<String, Object?> json) =>
      _$DataDtoFromJson(json);
}

@freezed
class ResultDto with _$ResultDto {
  const factory ResultDto({
    String? code,
    String? message,
    List<ErrorDto>? errorList,
  }) = _ResultDto;

  factory ResultDto.fromJson(Map<String, Object?> json) =>
      _$ResultDtoFromJson(json);
}

@freezed
class ErrorDto with _$ErrorDto {
  const factory ErrorDto({
    String? field,
    String? value,
    String? reason,
  }) = _ErrorDto;

  factory ErrorDto.fromJson(Map<String, Object?> json) =>
      _$ErrorDtoFromJson(json);
}
