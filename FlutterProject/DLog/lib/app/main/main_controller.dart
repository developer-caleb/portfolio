import 'package:get/get.dart';

import 'package:locationdiary/app/post/post_page.dart';

class MainController extends GetxController {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void changeTabIndex(int index) {
    if (index != 1) {
      _tabIndex = index;
      update();
    } else {
      Get.to(() => PostPage(
        isEdit: false,
        bodyText: '',
        dateTime: '',
      ));
    }
  }
}
