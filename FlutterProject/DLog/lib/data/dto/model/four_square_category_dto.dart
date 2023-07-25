import 'package:freezed_annotation/freezed_annotation.dart';

part 'four_square_category_dto.freezed.dart';
part 'four_square_category_dto.g.dart';

@freezed
class FourSquareCategoryDto with _$FourSquareCategoryDto {

  factory FourSquareCategoryDto({
    String? id,
    String? name,
    String? pluralName,
    String? shortName,
    Map<String, dynamic>? icon,
    bool? primary,
  }) = _FourSquareCategoryDto;

  factory FourSquareCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$FourSquareCategoryDtoFromJson(json);
}