import 'package:get/get.dart';
import 'package:hanaromart/tools/logger.dart';

class ReceiptListController extends GetxController {
  final RxBool _agreeElectronicReceipt = false.obs;

  bool get agreeElectronicReceipt => _agreeElectronicReceipt.value;
  final RxInt _durationIndex = 0.obs;

  int get durationIndex => _durationIndex.value;
  //List<String> durationList = ['3개월', '1개월', '1주일'];

  void onChangeSwitch() {
    _agreeElectronicReceipt.toggle();
  }

  void selectDuration(int index) {
    logger.d('selectDuration');
    _durationIndex.value = index;
  }
}
