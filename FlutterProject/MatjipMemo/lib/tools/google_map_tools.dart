import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matjipmemo/data/repo/helper/serializable.dart';
import 'package:matjipmemo/service/algolia_service.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:url_launcher/url_launcher.dart';

Future<BitmapDescriptor> getMarkerBitmap({required Color color, Color? secondColor, String? text, required int clusterCount, bool containString = true, bool containCircle = true}) async {
  bool isIos = Platform.isIOS;
  int size = !isIos ? 260 : 195;
  if (kIsWeb) size = (size / 2).floor();

  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = color;
  final Paint paint2 = Paint()..color = Colors.white;
  final Paint paint3 = Paint()..color = secondColor ?? color;
  var size2 = size / 2;
  if (containCircle) {
    if (clusterCount > 1) {
      canvas.drawCircle(Offset(size / 2, size / 2), size / 3.8, paint3);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 4.6, paint2);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 5.2, paint1);
    } else {
      canvas.drawCircle(Offset(size / 2, size2 / 1.5), size2 / 3.7, paint3);
      canvas.drawCircle(Offset(size / 2, size2 / 1.5), size2 / 4.7, paint2);
      canvas.drawCircle(Offset(size / 2, size2 / 1.5), size2 / 6, paint1); // 9*1.46666666667 = 13.2
    }
  }

  if (text != null && containString) {
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    TextPainter painter2 = TextPainter(textDirection: TextDirection.ltr);
    if (clusterCount > 1) {
      ///multiple cluster
      painter.text = TextSpan(
        text: clusterCount.toString(),
        style: TextStyle(fontSize: size * 0.9 / 4, color: Colors.white, fontWeight: FontWeight.w500),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    } else {
      ///single cluster
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: (size) / 6,
          //color: Colors.black87,
          fontWeight: FontWeight.w700,
          foreground: Paint()
            ..color = Colors.white
            ..strokeWidth = 8
            ..style = PaintingStyle.stroke,
        ),
      );
      painter2.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: (size) / 6,
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
      );

      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size2 + 6),
      );
      painter2.layout();
      painter2.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size2 + 6),
      );
    }
  }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}

Future<BitmapDescriptor> getOnlyMarkerBitmap({required Color color, Color? secondColor, String? text, required int clusterCount, bool containString = true, bool containCircle = true}) async {
  ///multi의 marker, String 을 만든다. single은 marker만 만들어준다.
  bool isIos = Platform.isIOS;
  int size = !isIos ? 130 : 100;
  if (kIsWeb) size = (size / 2).floor();

  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = color;
  final Paint paint2 = Paint()..color = Colors.white;
  final Paint paint3 = Paint()..color = secondColor ?? color;
  var size2 = size / 2;
  if (containCircle) {
    if (clusterCount > 1) {
      canvas.drawCircle(Offset(size / 2, size / 2), size / 2, paint3);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 2.3, paint2);
      canvas.drawCircle(Offset(size / 2, size / 2), size / 2.6, paint1);
    } else {
      canvas.drawCircle(Offset(size / 2, size / 2), size2 / 1.8, paint3);
      canvas.drawCircle(Offset(size / 2, size / 2), size2 / 2.3, paint2);
      canvas.drawCircle(Offset(size / 2, size / 2), size2 / 3, paint1); // 9*1.46666666667 = 13.2
    }
  }
  TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
  TextPainter painter2 = TextPainter(textDirection: TextDirection.ltr);
  if (clusterCount > 1) {
    ///multiple cluster
    painter.text = TextSpan(
      text: clusterCount.toString(),
      style: TextStyle(fontSize: size * 2 / 4, color: Colors.white, fontWeight: FontWeight.w500),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );
  }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}

Future<BitmapDescriptor> getStringMarkerBitmap({required Color color, Color? secondColor, String? text, required int clusterCount, bool containString = true, bool containCircle = true}) async {
  ///multi의 marker, String 을 만든다. single은 marker만 만들어준다.
  bool isIos = Platform.isIOS;
  int size = !isIos ? 260 : 195;
  if (kIsWeb) size = (size / 2).floor();

  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);

  var size2 = size / 2;

  if (text != null && containString) {
    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    TextPainter painter2 = TextPainter(textDirection: TextDirection.ltr);
    if (clusterCount > 1) {
    } else {
      ///single cluster
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: (size) / 6,
          //color: Colors.black87,
          fontWeight: FontWeight.w700,
          foreground: Paint()
            ..color = Colors.white
            ..strokeWidth = 8
            ..style = PaintingStyle.stroke,
        ),
      );
      painter2.text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: (size) / 6,
          color: Colors.black87,
          fontWeight: FontWeight.w700,
        ),
      );

      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size2 / 4 + 6),
      );
      painter2.layout();
      painter2.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size2 / 4 + 6),
      );
    }
  }

  final img = await pictureRecorder.endRecording().toImage(size, (2 * size / 3).toInt());
  final data = await img.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}

Future geoIntent({required String address, required double latitude, required double longitude, required String matjipName}) async {
  logger.d('intent url-> geo:0.0 ?q= $address ');
  String _url = 'geo:$latitude,$longitude?q= $matjipName ';
  try {
    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  } catch (e) {
    logger.e(e);
  }
}

GeoFirePoint? getGeoFirePoint(Map<String, dynamic> map) {
  // logger.d('onGetGeoFirePoint' + map.toString());
  if (map['geopoint'] != null) {
    //Firebase
    GeoPoint? geoPoint = Serializable.fromGeoPoint(map['geopoint']);
    return GeoFirePoint(geoPoint?.latitude ?? 0, geoPoint?.longitude ?? 0);
  } else if (map[AlgoliaService.KEY_GEOLOC] != null || map[AlgoliaService.KEY_GEOLOC] != null) {
    //알고리아
    return GeoFirePoint(Serializable.fromDouble(map[AlgoliaService.KEY_GEOLOC]['lat']), Serializable.fromDouble(map[AlgoliaService.KEY_GEOLOC]['lng']));
  } else {
    return null;
  }
}
/*
Map<String, dynamic> geoFirePointToMap(GeoFirePoint geoFirePoint){
  Map<String, dynamic> map ={};
  map['geopoint'] = geoFirePoint.da
  return GeoFirePoint(geopoint.latitude, geopoint.longitude);
}*/
