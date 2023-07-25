import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model_dto.freezed.dart';
part 'user_model_dto.g.dart';

@freezed
class UserModelDto with _$UserModelDto {
  factory UserModelDto(
      {String? userNickname,
        String? userProfileImgUrl,
        String? grantType,
        String? accessToken,
        String? refreshToken,
        int? userSeq,
      }) = _UserModelDto;

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);
}
