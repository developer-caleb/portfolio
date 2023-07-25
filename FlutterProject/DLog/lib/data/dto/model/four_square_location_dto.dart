import 'package:freezed_annotation/freezed_annotation.dart';

part 'four_square_location_dto.freezed.dart';
part 'four_square_location_dto.g.dart';

@freezed
class FourSquareLocationDto with _$FourSquareLocationDto {

  factory FourSquareLocationDto({
    String? address,
    String? crossStreet,
    double? lat,
    double? lng,
    List<Map<String, dynamic>>? labeledLatLngs,
    double? distance,
    String? postalCode,
    String? cc,
    String? city,
    String? state,
    String? country,
    List<String>? formattedAddress,
  }) = _FourSquareLocationDto;

  factory FourSquareLocationDto.fromJson(Map<String, dynamic> json) =>
      _$FourSquareLocationDtoFromJson(json);
}