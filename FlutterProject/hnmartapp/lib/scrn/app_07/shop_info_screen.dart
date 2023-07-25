import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/data/models/shop.dart';
import 'package:hanaromart/scrn/app_07/app07_controller.dart';
import 'package:hanaromart/scrn/app_07/component/map.dart';
import 'package:hanaromart/scrn/app_07/component/shop_detail.dart';
import 'package:hanaromart/widgets/custom_widget.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:hanaromart/widgets/dialog.dart';

class ShopInfoScreen extends StatelessWidget {
  final Shop item = Get.arguments;

  ShopInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '',
        body: GetBuilder<App07Controller>(
            init: App07Controller(),
            builder: (App07Controller controller) {
              return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  introWidget(controller, context),
                  SizedBox(
                    height: 30,
                  ),
                  CustomKakaoMap(
                    appController: controller,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ShopDetailWidget(
                    item: item,
                    controller: controller,
                  )
                ],
              );
            }));
  }

  Widget introWidget(App07Controller controller, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomWidget().OpenIndicator(item.isOpening ?? false),
          const Spacer(),
          InkWell(
            onTap: () async {
              /*    if (controller.isLiked.value) {
                controller.toggleLike();
                return;
              }*/
              bool? result = await shopConfirmDialog(item: item);
              if (result ?? false) {
                controller.toggleLike();
              }
            },
            child: Row(
              children: [
                Obx(() => starIcon(item, controller)),
                const SizedBox(width: 7),
                const Text(
                  '단골매장지정',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "Pretendard"),
                ),
                const SizedBox(width: 7),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget starIcon(item, App07Controller controller) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Image.asset('assets/app_06/star.png',
              scale: 1.5, color: controller.isLiked.value == true ? Colors.red[400] : null),
        ));
  }
}
