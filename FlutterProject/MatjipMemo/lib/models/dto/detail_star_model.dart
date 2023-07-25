import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_star_model.freezed.dart';
part 'detail_star_model.g.dart';

@freezed
class DetailStarModel with _$DetailStarModel {
  // Added constructor. Must not have any parameter
  const DetailStarModel._();

  factory DetailStarModel({required double taste, required double service, required double price, required double atmosphere, required double waiting}) = _DetailStarModel;

  factory DetailStarModel.value(double value) => DetailStarModel(taste: value, service: value, price: value, atmosphere: value, waiting: value);

  //toJson을 좀 바꾸자, map 으로 넣거나?
  double toAverage() {
    return (taste + service + price + atmosphere + waiting) / 5;
  }

  factory DetailStarModel.fromJson(Map<String, dynamic> json) => _$DetailStarModelFromJson(json);
}
