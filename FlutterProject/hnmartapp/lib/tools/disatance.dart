import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomLocationService {
  //현재 위치와 가게 위치 거리 구하는메소드
  int getDistance(lat1, lon1, lat2, lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) ~/ 1000;
  }

  Future<bool> checkPermission() async {
    PermissionStatus status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      openAppSettings();
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
}
