import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_res.freezed.dart';

part 'common_res.g.dart';

@freezed
class CommonRes with _$CommonRes {
  const factory CommonRes({
    // required DataDto data,
    ResultDto? result,
  }) = _CommonRes;

  factory CommonRes.fromJson(Map<String, Object?> json) =>
      _$CommonResFromJson(json);
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
