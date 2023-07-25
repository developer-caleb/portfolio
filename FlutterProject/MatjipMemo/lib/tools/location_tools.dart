import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;
import 'package:maps_toolkit/maps_toolkit.dart' as maptools;
import 'package:matjipmemo/constants/strings.dart';
import 'package:matjipmemo/data/repo/search_network_repository.dart';
import 'package:matjipmemo/models/google_location/add_map_model.dart';
import 'package:matjipmemo/models/google_location/location.dart';
import 'package:matjipmemo/models/social_place_model.dart';
import 'package:permission_handler/permission_handler.dart';

import 'logger.dart';

Position? position;

String getDistance(double? startLatitude, double? startLongitude, double? endLatitude, double? endLongitude) {
  if (startLatitude == null || startLongitude == null) return "";
  var result = Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude!, endLongitude!).toInt();
  if (result < 1000) return "${result}m";
  result = result ~/ 1000;
  return "${result}km";
}

//Google
Future<String> getAddressFromGoogle(double lat, double lng) async {
  final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey';
  var dio = Dio();
  var response = await dio.get(url, options: Options(contentType: 'application/json; charset=utf-8'));
  return response.data['results'][0]['fommattted_address'];
}

bool get isKorean => (Get.locale?.languageCode ?? 'en') == 'ko';

bool isInKorea({required double lat, required double lng}) {
  //한국 지도 boundary
  logger.d('isInKorea $lat , $lng ');
  final maptools.LatLng p1 = maptools.LatLng(38.8734, 128.5474);
  final maptools.LatLng p2 = maptools.LatLng(37.2854, 132.7381);
  final maptools.LatLng p3 = maptools.LatLng(34.8685, 129.3476);
  final maptools.LatLng p4 = maptools.LatLng(32.4981, 126.5514);
  final maptools.LatLng p5 = maptools.LatLng(33.9712, 124.8472);
  final maptools.LatLng p6 = maptools.LatLng(38.2347, 124.0756);
  final polygon = [p1, p2, p3, p4, p5, p6];
  var point = maptools.LatLng(lat, lng);
  return maptools.PolygonUtil.containsLocation(point, polygon, false);
}

Future<AddMapModel> geocodeFromVWorld(double lat, double lng) async {
  var resultString = "";
  var matjipQueryResponse = await Dio().get("http://api.vworld.kr/req/address",
      //  "location=35.335004496406405%2C129.03482296472527",
      queryParameters: {
        "service": "address",
        "request": "getAddress",
        "version": "2.0",
        "point": "$lng,$lat",
        "format": "json",
        "errorFormat": "json",
        //"type": "ROAD",
        "type": "BOTH",
        "key": myVworldKey,
        //"language":"ko"
      });
  logger.d(matjipQueryResponse.data);
  if (matjipQueryResponse.statusCode == 200) {
    try {
      resultString = (matjipQueryResponse.data["response"]["result"] as List<dynamic>).last["text"];
      resultString = resultString.split("(").first;
    } catch (e) {
      logger.e(e);
    }
  }
  return AddMapModel(address: resultString, latLng: Location(lat: lat, lng: lng));
}

String getPostalCodeFromArdAddress(String ardAddress) {
  dom.Document document = parse.parse(ardAddress);
  final List<dom.Element> postalCodeList = document.getElementsByClassName('postal-code');
  if (postalCodeList.isNotEmpty) {
    return postalCodeList.first.text;
  } else {
    return '';
  }
}

String getAddressSimpleFromArdAddress(String ardAddress) {
  List<String> addressSimpleList = [];
  dom.Document document = parse.parse(ardAddress);
  final List<dom.Element> countryList = document.getElementsByClassName('country-name');
  final List<dom.Element> regionList = document.getElementsByClassName('region');
  final List<dom.Element> localityList = document.getElementsByClassName('locality');
  if (countryList.isNotEmpty) {
    addressSimpleList.add(countryList.first.text);
  }
  if (regionList.isNotEmpty) {
    addressSimpleList.add(regionList.first.text);
  }
  if (localityList.isNotEmpty) {
    addressSimpleList.add(localityList.first.text);
  }
  return addressSimpleList.sublist(0, min(2, addressSimpleList.length)).join(' ');
}

Future<AddMapModel> geocodeFromGoogle({
  required double lat,
  required double lng,
}) async {
  String languageCode = Get.locale?.languageCode ?? 'en';
  logger.d(
    'languageCode -> $languageCode \n latlng $lat, $lng',
  );

  var matjipQueryResponse = await Dio().get("https://maps.googleapis.com/maps/api/geocode/json", queryParameters: {
    "latlng": "$lat, $lng",
    "key": googleApiKey,
    "language": languageCode,
  });
  logger.d(matjipQueryResponse.data);
  if (matjipQueryResponse.statusCode == 200) {
    try {
      List list = (matjipQueryResponse.data["results"] as List<dynamic>);
      if (list.isNotEmpty) {
        logger.d('list first ${list.first}');
        logger.d('list first[formatted_address] ${list.first['formatted_address']}');
        SocialPlaceModel socialModel =
            await searchNetworkRepository.findGoogleDetailPlace(language: languageCode, placeId: list.first['place_id'], placeModel: SocialPlaceModel(addressName: list.first['formatted_address']));
        return AddMapModel(address: socialModel.addressName, latLng: Location(lat: lat, lng: lng), postalCode: socialModel.postalCode, addressSimple: socialModel.addressSimple);
      }
    } catch (e) {
      logger.e(e);
    }
  }
  return AddMapModel(address: '', latLng: Location(lat: lat, lng: lng));
}

Future<String> geocodeFromKakao(double lat, double lng) async {
  var resultString = "";
  var matjipQueryResponse = await Dio().get("https://dapi.kakao.com/v2/local/geo/coord2address.json",
      //  "location=35.335004496406405%2C129.03482296472527",
      queryParameters: {
        "x": lng,
        "y": lat,
        //"language":"ko"
      },
      options: Options(headers: {'Authorization': 'KakaoAK c07ba7b77fc54e7cff1a58a3337378cc'}));
  logger.d(matjipQueryResponse.data);
  if (matjipQueryResponse.statusCode == 200) {
    try {
      resultString = matjipQueryResponse.data["documents"][0]["road_address"] != null
          ? matjipQueryResponse.data["documents"][0]["road_address"]['address_name']
          : matjipQueryResponse.data["documents"][0]["address"]['address_name'];
    } catch (e) {
      logger.e(e);
    }
  }
  return resultString;
}

Future<List<Map<String, dynamic>>> autoCompleteListFromGoogle(String query) async {
  logger.d("matjip autoCompleteList");
  Position? position = await getPosition();
  var matjipQueryRequest = await Dio().request("https://maps.googleapis.com/maps/api/place/autocomplete/json", queryParameters: {
    "input": query,
    "key": googleApiKey,
    "location": "${position!.latitude} , ${position.longitude}",
    "rankby": "distance",
    "language": "ko",
  });
  logger.d("autoCompleteList? ${matjipQueryRequest.data["predictions"].toString()}");
  List<Map<String, dynamic>> resultArray = [];

  for (int i = 0; i < matjipQueryRequest.data["predictions"].length; i++) {
    var newstring = matjipQueryRequest.data["predictions"][i];
    resultArray.add(newstring);
  }

  return resultArray;
}

Future<LatLng?> findDetailPlace(String placeId) async {
  LatLng? latLng;
  final endpoint = "https://maps.googleapis.com/maps/api/place/details/json?key=$googleApiKey" "&placeid=$placeId" '&language=ko';
  var detailPlaceRequest = await Dio().request(endpoint);
  if (detailPlaceRequest.statusCode == 200 || detailPlaceRequest.statusCode == 201) {
    Map<String, dynamic> location = detailPlaceRequest.data['result']['geometry']['location'];
    latLng = LatLng(location['lat'], location['lng']);
  }
  return latLng;
}

Future<Position?> getPosition({bool refresh = false}) async {
  logger.d('get position');
  if (await Permission.locationWhenInUse.request().isGranted) {
    logger.d(Permission.locationWhenInUse.status.then((value) {
      logger.d("value2:$value");
    }));
  }
  var status = await Permission.location.status;
  var status2 = await Permission.locationAlways.status;
  var status3 = await Permission.locationWhenInUse.status;
  logger.d('$status , $status2 , $status3');
  if (!status.isGranted && !status.isPermanentlyDenied && !status2.isGranted && !status3.isGranted) {
    logger.d('$status $status2 $status3');
    await Get.dialog(AlertDialog(
      title: Text('위치정보 권한 동의'.tr),
      content: Text('EATRIP의 기능을 정상적으로 실행하기 위해서는 위치 권한 동의가 필요합니다.\n1. 주변 식당 검색\n2. 지도기능'.tr),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "확인",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            Get.back();
          },
        ),
      ],
    ));
  }
  if (status.isPermanentlyDenied) {
    //isPermanentlyDenied 가 ios에서만 동작함..
    await Get.dialog(AlertDialog(
      title: Text('위치 차단하여 앱기능을 사용할 수 없습니다'.tr),
      content: Text('EATRIP의 기능을 정상적으로 실행하기 위해서는 위치 권한 동의가 필요합니다.\n1. 주변 식당 검색\n2. 지도기능\n'.tr),
      actions: <Widget>[
        TextButton(
          child: Text(
            "앱 설정".tr,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            await openAppSettings(); //지금 현재 안드에서는 동작 안하고 ios에서만 동작함
            Get.back();
          },
        ),
        TextButton(
          child: Text(
            "취소".tr,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            Get.back();
          },
        ),
      ],
    ));
  }
  try {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium).timeout(const Duration(milliseconds: 1300));
    /*  if (refresh) {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium).timeout(const Duration(milliseconds: 1300));
    } else {
      position ??= await Geolocator.getLastKnownPosition(forceAndroidLocationManager: false);
    }*/
    return position!;
  } on TimeoutException catch (_) {
    return await Geolocator.getLastKnownPosition(forceAndroidLocationManager: false);
  } catch (e) {
    return null;
  }
}

Locale? localeFromString(String? localeStr) {
  switch (localeStr) {
    case 'en-US':
      return Locale('en', 'US');
    case 'ko-KR':
      return Locale('ko', 'KR');
    default:
      return null;
  }
}
