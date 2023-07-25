import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locationdiary/data/dto/model/result_dto.dart';
import 'package:locationdiary/data/dto/model/user_model_dto.dart';

part 'guest_login_dto.freezed.dart';
part 'guest_login_dto.g.dart';

@freezed
class GuestLoginDto with _$GuestLoginDto {
  const factory GuestLoginDto({
    required UserModelDto? data,
    required ResultDto? result,
  }) = _GuestLoginDto;
  factory GuestLoginDto.fromJson(Map<String, Object?> json) =>
      _$GuestLoginDtoFromJson(json);
}