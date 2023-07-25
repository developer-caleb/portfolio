import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locationdiary/data/models/response/volume_model_res.dart';

part 'get_volumes_res.freezed.dart';

part 'get_volumes_res.g.dart';

@freezed
class GetVolumesRes with _$GetVolumesRes {
  const factory GetVolumesRes({
    DataDto? data,
    ResultDto? result,
  }) = _GetVolumesRes;

  factory GetVolumesRes.fromJson(Map<String, Object?> json) =>
      _$GetVolumesResFromJson(json);
}

@freezed
class DataDto with _$DataDto {
  const factory DataDto({
    int? total,
    List<VolumeModelRes>? list,
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
