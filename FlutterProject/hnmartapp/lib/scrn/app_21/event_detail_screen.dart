import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_21/event_detail_controller.dart';
import 'package:hanaromart/scrn/app_23/component/coupon_botton_sheet.dart';
import 'package:hanaromart/scrn/app_23/component/stamp_widget.dart';
import 'package:hanaromart/tools/enums.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/tools/toast.dart';
import 'package:hanaromart/widgets/buttons/back_button1.dart';
import 'package:hanaromart/widgets/camera_setting_snackbar.dart';
import 'package:hanaromart/widgets/labeled_checked_box.dart';
import 'package:permission_handler/permission_handler.dart';

class EventDetailScreen extends GetView<EventDetailController> {
  const EventDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.eventModel.isCompleted && controller.eventModel.type == EventType.stamp) {
      Future.microtask(() => couponBottomSheet());
    }
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        title: Text('이벤트'),
        leading: BackButton1(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Color(0xFF3B3B3A),
          ),
        ),
      ),
      body: ListView(
        children: [
          Placeholder(
            fallbackHeight: 860,
          ),
          personalInfoAgree(),
          SizedBox(
            height: 36,
          ),
          contents(context),
          goToRelevantPageButton(),
          SizedBox(
            height: 280,
          ),
        ],
      ),
    );
  }

  Widget contents(BuildContext context) {
    switch (controller.eventModel.type) {
      case EventType.normal:
        return Padding(padding: EdgeInsets.only(bottom: 40), child: applyEvent());
      case EventType.giveaway:
        return Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: controller.eventModel.isCompleted ? doneEvent() : eventQRButton());
      case EventType.stamp:
        return stamp(context);
    }
  }

  Widget disabledButton(String text) {
    return AbsorbPointer(
      absorbing: true,
      child: TextButton(
        style: AppStyle.eventButtonStyle.copyWith(
            foregroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3E4541))),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  Widget stamp(BuildContext context) {
    StampState stampState = StampState.normal;
    Widget titleButton = eventQRButton();
    if (controller.eventModel.remains == 0) {
      titleButton = disabledButton('스탬프 상품 소진');
      stampState = StampState.exhausted;
    }
    if (controller.eventModel.earnedStamps == 10) {
      titleButton = disabledButton('스탬프 적립 완료');
      stampState = StampState.complete;
    }
    if (controller.eventModel.isReceived) {
      titleButton = disabledButton('상품 교환 완료');
      stampState = StampState.received;
    }

    return Column(
      children: [
        Container(margin: EdgeInsets.symmetric(horizontal: 20), width: double.maxFinite, child: titleButton),
        SizedBox(
          height: 45,
        ),
        StampWidget(
          totalNumber: 10,
          earnedStamps: controller.eventModel.earnedStamps,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffD51C36),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 36),
          padding: EdgeInsets.symmetric(vertical: 11, horizontal: 30),
          child: Text(
            '교환 가능 상품 ${controller.eventModel.remains}개 남음',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              letterSpacing: -0.23,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 36),
          child: SizedBox(
            width: double.maxFinite,
            child: TextButton(
                style: AppStyle.eventButtonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
                    foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF000000)),
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(width: 1, color: Colors.black))),
                onPressed: () {},
                child: Text('교환 내역 확인')),
          ),
        ),
      ],
    );
  }

  Padding goToRelevantPageButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style: AppStyle.eventButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)),
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF000000)),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(width: 1, color: Colors.black))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage('assets/app_20/ic_share.png'),
                size: 23,
              ),
              SizedBox(
                width: 5,
              ),
              Text('관련 페이지 이동'),
            ],
          )),
    );
  }

  Padding eventQRButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style:
              AppStyle.eventButtonStyle.copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03A64A))),
          onPressed: () async {
            bool result = await permissionCheck();
            if (result) {
              Get.toNamed(Routes.QRCODE_SCAN);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(AssetImage('assets/app_20/ic_camera.png')),
              SizedBox(
                width: 5,
              ),
              Text('이벤트 QR 인식'),
            ],
          )),
    );
  }

  Future<bool> permissionCheck() async {
    PermissionStatus permissionStatus = await Permission.camera.request();
    logger.d('camera permissionStatus : $permissionStatus');
    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      Get.showSnackbar(cameraSettingSnackBar());
      return false;
    }
    if (permissionStatus != PermissionStatus.granted) {
      logger.d('camera permissionStatus : $permissionStatus');
      showToast('카메라 기능이 허용 되지 않았습니다.');
      return false;
    } else {
      return true;
    }
  }

  Padding doneEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              style: AppStyle.eventButtonStyle
                  .copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3E4541))),
              onPressed: () {},
              child: Text('이벤트 응모 완료')),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: AppStyle.eventButtonStyle
                  .copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF112EC3))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage('assets/app_20/ic_apply_event.png')),
                  SizedBox(
                    width: 5,
                  ),
                  Text('추첨 결과 확인'),
                ],
              )),
        ],
      ),
    );
  }

  Padding applyEvent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
          style:
              AppStyle.eventButtonStyle.copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03A64A))),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(AssetImage('assets/app_20/ic_apply_event.png')),
              SizedBox(
                width: 5,
              ),
              Text('이벤트 응모'),
            ],
          )),
    );
  }

  Column personalInfoAgree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 4,
          thickness: 4,
          color: Color(0xFFC2C3CD),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '개인정보 수집동의 안내',
                style: TextStyle(
                  color: Color(0xFF000807),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Color(0xFF41886F),
                      foregroundColor: Colors.white),
                  child: Text('약관보기')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            '※ 이벤트 참여를 위해 아래의 동의가 필요합니다.',
          ),
        ),
        Obx(
          () => LabeledCheckbox(
              label: '매장 행사 안내 및 이벤트 정보 수신 동의',
              value: controller.agreeReceiveEvent,
              onChanged: controller.onChangeAgreeReceiveEvent,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
        ),
        Obx(
          () => LabeledCheckbox(
            label: '개인정보의 선택적 수집 이용 및 이용 동의',
            value: controller.agreePersonalInfo,
            onChanged: controller.onChangeAgreePersonalInfo,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
        ),
        Obx(
          () => LabeledCheckbox(
            label: '개인정보의 선택적 제공 동의',
            value: controller.agreePersonalSelectiveInfo,
            onChanged: controller.onChangeAgreePersonalSelectiveInfo,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 4,
          thickness: 4,
          color: Color(0xFFC2C3CD),
        ),
      ],
    );
  }
}
