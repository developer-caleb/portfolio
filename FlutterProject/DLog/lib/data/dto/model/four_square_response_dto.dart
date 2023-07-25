import 'package:freezed_annotation/freezed_annotation.dart';

part 'four_square_response_dto.freezed.dart';
part 'four_square_response_dto.g.dart';

@freezed
class FourSquareResponseDto with _$FourSquareResponseDto {

  factory FourSquareResponseDto({
    Map<String, dynamic>? meta,
    Map<String, dynamic>? response,
  }) = _FourSquareResponseDto;

  factory FourSquareResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FourSquareResponseDtoFromJson(json);
}