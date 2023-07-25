import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:locationdiary/data/dto/model/four_square_category_dto.dart';
import 'package:locationdiary/data/dto/model/four_square_location_dto.dart';

part 'four_square_venue_dto.freezed.dart';
part 'four_square_venue_dto.g.dart';

@freezed
class FourSquareVenueDto with _$FourSquareVenueDto {

  factory FourSquareVenueDto({
    String? venueId,
    String? name,
    FourSquareLocationDto? location,
    String? city,
    String? state,
    String? cc,
    List<FourSquareCategoryDto>? categories,
    double? rating,
  }) = _FourSquareVenueDto;

  factory FourSquareVenueDto.fromJson(Map<String, dynamic> json) =>
      _$FourSquareVenueDtoFromJson(json);
}