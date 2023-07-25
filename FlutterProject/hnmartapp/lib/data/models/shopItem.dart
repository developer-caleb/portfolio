
class ShopModel{
  final String name;
  final String lat;
  final String lng;
  final int index;
  final String phone;
  final String dist;

  ShopModel(this.name, this.lat, this.lng, this.index, this.phone, this.dist);

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
      json['store_nm'] as String,
      json['lat'] as String,
      json['lng'] as String,
      json['store_cd'] as int,
      json['tel'] as String,
      json['dist'] as String,
    );
  Map<String, dynamic> toJson() => <String, dynamic>{
      'store_nm': name,
      'lat': lat,
      'lng': lng,
      'store_cd': index,
      'tel': phone,
      'dist': dist,
    };

 
}