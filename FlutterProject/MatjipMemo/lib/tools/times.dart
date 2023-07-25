import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension TimesToolsWithDateTime on DateTime {
  String toDuration() {
    var duration = DateTime.now().difference(this);
    if (duration > const Duration(days: 1)) {
      return DateFormat('yyyy.MM.dd').format(this);
    } else if (duration > const Duration(hours: 1)) {
      return "${duration.inHours.remainder(60)}시간 전".tr;
    } else if (duration > const Duration(minutes: 1)) {
      return "${duration.inMinutes.remainder(60)}분 전".tr;
    } else {
      return "방금 전".tr;
    }
  }

  String toDuration2() {
    var duration = DateTime.now().difference(this);
    if (duration > const Duration(days: 1)) {
      return DateFormat('yy.MM.dd').format(this);
    } else if (duration > const Duration(hours: 1)) {
      return "${duration.inHours.remainder(60)}시간 전".tr;
    } else if (duration > const Duration(minutes: 1)) {
      return "${duration.inMinutes.remainder(60)}분 전".tr;
    } else {
      return "방금 전".tr;
    }
  }

  String timeFormatYYYYMMDDEEE() {
    return DateFormat('yyyy년 MM월 dd일 EEEE', Get.locale.toString()).format(this);
  }
}

extension TimesToolsWithString on String {
  String toDuration() => DateTime.parse(this).toDuration();
}

String timeFormatYYYYMMDD(String savedDateStr) {
  var savedDate = DateTime.parse(savedDateStr);
  return DateFormat('yyyy.MM.dd').format(savedDate);
}

String timeFormatMMDDHHMM(DateTime savedDate) {
  return DateFormat('MM월 dd일 HH:mm').format(savedDate);
}

String timeFormatYYYYMMDDEEE(DateTime savedDate) {
  return DateFormat('yyyy년 MM월 dd일 EEEE', Get.locale.toString()).format(savedDate);
}
