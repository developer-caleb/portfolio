import 'package:get/get.dart';
import 'package:hanaromart/data/helper/serialiazable.dart';
import 'package:hanaromart/data/models/event_model.dart';

class EventDetailController extends GetxController {
  final RxBool _agreeReceiveEvent = false.obs;
  bool get agreeReceiveEvent => _agreeReceiveEvent.value;
  final RxBool _agreePersonalInfo = false.obs;
  bool get agreePersonalInfo => _agreePersonalInfo.value;
  final RxBool _agreePersonalSelectiveInfo = false.obs;
  bool get agreePersonalSelectiveInfo => _agreePersonalSelectiveInfo.value;
  late EventModel eventModel;
  @override
  void onInit() {
    super.onInit();
    int type = -1;
    type = int.parse(Get.parameters['type'] ?? '-1');
    eventModel = EventModel(
        type: Serializable.fromEvent(type),
        isEnded: false,
        remains: 500,
        isCompleted: false,
        isReceived: false,
        earnedStamps: 10);
  }

  void onChangeAgreeReceiveEvent(bool value) {
    _agreeReceiveEvent.value = value;
  }

  void onChangeAgreePersonalInfo(bool value) {
    _agreePersonalInfo.value = value;
  }

  void onChangeAgreePersonalSelectiveInfo(bool value) {
    _agreePersonalSelectiveInfo.value = value;
  }
}
