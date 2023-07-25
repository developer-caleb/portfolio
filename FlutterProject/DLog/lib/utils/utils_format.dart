import 'package:intl/intl.dart';

class TimesFormat {
  static String toDateStrDot(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('yyyy.MM.dd').format(dateTime);
  }

  static String toDateStrDotYYYYMM(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat('yyyy.MM').format(dateTime);
  }

  static String toTimeStrHHMMA(DateTime? date) {
    if (date == null) return '';
    return DateFormat('hh:mm a').format(date);
  }

  static String toDateTimeForRequest(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyyMMddHHmmss').format(date);
  }

  static String toMonthMM(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MM').format(date);
  }
  static String toMonthMMM(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM').format(date);
  }

  static String yearMonthDateFormat(String dateTime) {
    String year = dateTime.substring(0, 4);
    String month = dateTime.substring(4, 6);
    String date = dateTime.substring(6, 8);
    return '$year.$month.$date';
  }

  static String dateTimeFormat(String dateTime) {
    String hours, minutes, ampm;
    final dateStringToInt = int.parse(dateTime.substring(8, 10));

    if (dateStringToInt > 12) {
      hours = (dateStringToInt - 12).toString();
      ampm = 'pm';
    } else if (dateStringToInt < 10) {
      hours = dateTime.substring(9, 10);
      ampm = 'am';
    } else {
      hours = dateTime.substring(8, 10);
      if (dateStringToInt == 12) {
        ampm = 'pm';
      } else {
        ampm = 'am';
      }
    }

    minutes = dateTime.substring(10, 12);

    return '$hours:$minutes $ampm';
  }

}
