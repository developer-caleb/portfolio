import 'package:fluttertoast/fluttertoast.dart';
import 'package:locationdiary/utils/app_colors.dart';

void showToast(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      fontSize: 14,
      textColor: AppColors.systemWhite,
      backgroundColor: AppColors.systemBlack60,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
