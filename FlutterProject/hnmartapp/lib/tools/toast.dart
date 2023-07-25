import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'logger.dart';

void showToast(String message, {bool isLong = false}) {
  Fluttertoast.cancel();
  logger.d('시스템 : toast message-> $message');
  Fluttertoast.showToast(
      fontSize: 16,
      msg: message,
      textColor: Colors.grey[50],
      backgroundColor: Colors.black87.withOpacity(0.7),
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
