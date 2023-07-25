import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:matjipmemo/service/algolia_service.dart';
import 'package:matjipmemo/tools/logger.dart';

class Serializable {
  static Object? asNull(_) => null;
  static String key_geoPoint = 'geopoint';

  static double fromDouble(v) {
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is String) {
      return double.parse(v);
    }
    if (v == null) return 0.0;
    return 0.0;
  }

  static int fromInt(v) {
    if (v == null) return 0;
    try {
      if (v is int) {
        return v;
      }
      if (v is String) {
        return int.parse(v);
      }
      if (v is double) {
        return v.toInt();
      }
    } catch (e) {
      logger.e(e);
      return 0;
    }
    return 0;
  }

  static bool fromBool(v) {
    if (v == null) return false;
    try {
      if (v is num) {
        return v > 0;
      }
      if (v is String) {
        return v.toLowerCase().trim() == 'true';
      }
    } catch (e) {
      logger.e(e);
      return false;
    }
    return false;
  }

  static Timestamp fromTimestamp(v) {
    if (v == null) return Timestamp.now();
    if (v is Timestamp) return v;
    if (v is String) return Timestamp.fromMillisecondsSinceEpoch(int.parse(v));
    if (v is int) return Timestamp.fromMillisecondsSinceEpoch(v);
    try {
      if (v is Map) return Timestamp(v['_seconds'], v['_nanoseconds']);
    } catch (_) {}
    return Timestamp.now();
  }

  static GeoPoint? fromGeoPoint(v) {
    if (v == null) return null;
    if (v is GeoPoint) return v;
    if (v is Map) {
      return GeoPoint(v['lat'] ?? 37.565760, v['lng'] ?? 126.977927);
    }
    return null;
  }

  static GeoFirePoint? fromGeoFirePoint(v) {
    if (v == null) return null;
    try {
      if (v is GeoFirePoint) {
        return v;
      }
      if (v is Map) {
        if (v[key_geoPoint] != null) {
          if (v[key_geoPoint] is GeoPoint) {
            GeoPoint geoPoint = v[key_geoPoint];
            return GeoFirePoint(fromDouble(geoPoint.latitude), fromDouble(geoPoint.longitude));
          }
          if (v[key_geoPoint] is Map) {
            logger.d(v[key_geoPoint]);
            GeoPoint? geoMap = fromGeoPoint(v[key_geoPoint]);
            if (geoMap != null) {
              return GeoFirePoint(geoMap.latitude, geoMap.longitude);
            }
          }
        } else {
          //알고리아
          return GeoFirePoint(v[AlgoliaService.KEY_GEOLOC]['lat'], v[AlgoliaService.KEY_GEOLOC]['lng']);
        }
      }
    } catch (e) {
      logger.e(e);
      return null;
    }
    return null;
  }

  static Map<String, dynamic>? toJsonGeoFirePoint(GeoFirePoint? v) {
    if (v == null) return null;
    return v.data;
  }

  static Map<String, dynamic>? toJsonGeoPoint(GeoPoint? v) {
    if (v == null) return null;
    return {'lat': v.latitude, "lng": v.longitude};
  }

  static int? frommMapColor(v) {
    if (v == null) return null;
    if (v is int) return v;
    if (v is String) {
      return int.parse(v, radix: 16);
    }
    return null;
  }
}
