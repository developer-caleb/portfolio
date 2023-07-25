import 'package:get/get.dart';
import 'package:locationdiary/app/diary/diary_controller.dart';
import 'package:locationdiary/app/main/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DiaryController>(() => DiaryController());
  }
}
