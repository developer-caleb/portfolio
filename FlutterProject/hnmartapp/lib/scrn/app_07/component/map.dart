import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hanaromart/scrn/app_07/app07_controller.dart';

class CustomKakaoMap extends StatelessWidget {
  final App07Controller appController;
  const CustomKakaoMap({super.key, required this.appController});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
            child: GoogleMap(
              myLocationButtonEnabled: false,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                  zoom: 18.551926040649414, target: LatLng(appController.shop.lat, appController.shop.lng)),
              markers: Set.from(appController.marker),
            )));
  }
}
