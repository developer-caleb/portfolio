import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/scrn/app_16/receipt_list_controller.dart';
import 'package:hanaromart/scrn/app_17/receipt_image.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';
import 'package:hanaromart/widgets/buttons/duration_button_tab.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:hanaromart/widgets/image/logo_ci.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';
import 'package:hanaromart/widgets/texts/nh_gradient_text.dart';

class ReceiptList extends GetView<ReceiptListController> {
  const ReceiptList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '전자영수증',
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          BlueRoundedContainer(
            borderColor: Color(0xFF167BB4),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(left: 15), child: LogoCI()),
                    SizedBox(
                      width: 2.5,
                    ),
                    NHGradientText(
                      '전자영수증',
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Theme(
                          data: Theme.of(context).copyWith(useMaterial3: true),
                          child: Obx(() => Switch(
                              value: controller.agreeElectronicReceipt,
                              thumbColor: MaterialStateProperty.all(Colors.white),
                              onChanged: (value) {
                                controller.onChangeSwitch();
                              },
                              activeTrackColor: Color(0xff23A959),
                              inactiveTrackColor: Colors.grey))),
                    )
                  ],
                ),
                CheckLabel('해당 이벤트 종료 후 상품 교환 내역 자동 삭제됩니다.'),
                CheckLabel('해당 이벤트 종료 후 상품 교환 내역 자동 삭제됩니다.'),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //3개월 , 1개월, 1주일
          DurationButtonTab(
            valueChanged: (int value) {
              controller.selectDuration(value);
            },
          ),
          /*   Row(
            children: List.generate(controller.durationList.length,
                (index) => buildTextButton(text: controller.durationList[index], index: index)),
          ),*/

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text('총 000건'),
          ),
          Divider(
            color: Color(0xff3B3B3A),
          ),
          ...[receiptCard(), receiptCard(), receiptCard()]
        ],
      ),
    );
  }

/*  Widget buildTextButton({required String text, required index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Obx(() => TextButton(
            style: TextButton.styleFrom(
                foregroundColor: controller.durationIndex == index ? Colors.white : Colors.black,
                backgroundColor: controller.durationIndex == index ? Color(0xff27675F) : Colors.white,
                side: controller.durationIndex == index ? null : BorderSide(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
            onPressed: () {
              controller.selectDuration(index);
            },
            child: Text(text),
          )),
    );
  }*/

  Container receiptCard() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '농협하나로유통 고양유통센터',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.23,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    '2023-01-30',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.21,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('000,000원',
                    style: TextStyle(
                      color: Color(0xFF000001),
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.23,
                    )),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5F5F3),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 11),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      side: BorderSide(width: 2, color: Color(0xffC2C4CD)),
                      textStyle: TextStyle(
                        color: Color(0xFF1A1717),
                        fontSize: 13,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.20,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => ReceiptImage());
                    },
                    child: Text('영수증보기'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
