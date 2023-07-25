int getDayOfMonth(DateTime dateTime) {
  return DateTime.utc(dateTime.year, dateTime.month + 1, 0).day;
}

String getStringFromWeekday(int weekday) {
  switch (weekday) {
    case 1:
      return '월';
    case 2:
      return '화';
    case 3:
      return '수';
    case 4:
      return '목';
    case 5:
      return '금';
    case 6:
      return '토';
    case 7:
      return '일';
    default:
      return '월';
  }
}

bool isSameMonth(DateTime dateTime1, DateTime dateTime2) {
  if (dateTime1.year == dateTime2.year && dateTime1.month == dateTime2.month) {
    return true;
  } else {
    return false;
  }
}

bool isToday(
  DateTime dateTime1,
) {
  DateTime dateTime2 = DateTime.now();
  if (dateTime1.year == dateTime2.year &&
      dateTime1.month == dateTime2.month &&
      dateTime1.day == dateTime2.day) {
    return true;
  } else {
    return false;
  }
}

//Code for Utils Unit Text
/*void main() async {
  var newDate = DateTime.utc(2022, 2, 1);
  logger.d('newDate ${getDayOfMonth(newDate)}');
}*/
