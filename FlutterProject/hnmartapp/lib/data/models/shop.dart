class Shop {
  int index;
  String name;
  String number;
  int regionIndex;
  String regionName;
  int distance;
  double lat;
  double lng;
  bool? isOpening;
  bool? isLike;

  Shop(
    this.index,
    this.name,
    this.number,
    this.regionIndex,
    this.regionName,
    this.lat,
    this.lng,
    this.isLike,
    this.isOpening,
    this.distance,
  );
}
