import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';
import 'package:matjipmemo/data/repo/helper/serializable.dart';

part 'geo.freezed.dart';
part 'geo.g.dart';

@freezed
class Geo with _$Geo {
  factory Geo({
    @JsonKey(
      name: KEY_MAP_COLOR,
      fromJson: Serializable.frommMapColor,
    )
        int? mapColor,
    @JsonKey(
      name: KEY_GEO_LOCATION,
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint,
    )
    @JsonKey(
      name: '_geoloc',
      fromJson: Serializable.fromGeoPoint,
      toJson: Serializable.toJsonGeoPoint,
    )
        GeoPoint? geolocation,
    @JsonKey(
      name: KEY_PLACE_LOC,
      fromJson: Serializable.fromGeoFirePoint,
      toJson: Serializable.toJsonGeoFirePoint,
    )
        GeoFirePoint? placeLoc,
    @Default('')
    @JsonKey(name: KEY_ADDRESS)
        String? address,
    @Default('')
    @JsonKey(name: KEY_ADDRESS_SIMPLE)
        String? addressSimple,
    @Default('')
    @JsonKey(name: KEY_ADDRESSDETAIL)
        String? addressDetail,
    @Default('')
    @JsonKey(name: KEY_ADDRESSCODE)
        String? addressCode,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}
