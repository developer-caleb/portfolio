import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/data/models/shop.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/widgets/custom_widget.dart';

import '../app06_controller.dart';

class ShopList extends StatelessWidget {
  final controller = Get.find<App06Controller>();
  ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Column(children: controller.filteredShopModels.map((element) => shopItemWidget(context, element)).toList()));
  }

  List<Widget> caseRegion(BuildContext context, String regionName) {
    List<Widget> resultWidget;
    switch (regionName) {
      case "전체":
        resultWidget = controller.shopItems.map((e) => shopItemWidget(context, e)).toList();
        break;
      default:
        resultWidget = controller.shopItems
            .where((ele) => ele.regionName == regionName)
            .map((e) => shopItemWidget(context, e))
            .toList();
        break;
    }
    // controller.changeTotalLength(resultWidget.length);
    return resultWidget;
  }

  Widget shopItemWidget(BuildContext context, Shop item) {
    return Column(
      children: [
        Divider(
          color: Colors.black,
          height: 1,
        ),
        InkWell(
          onTap: () {
            logger.d('item ${item.name}');
            Get.toNamed(Routes.SHOP_INFO, arguments: item);
          },
          child: Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomWidget().OpenIndicator(item.isOpening ?? false),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomWidget().withIconText(0, item.name),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomWidget().withIconText(1, item.number),
                  ],
                ),
                controller.filterIndex.value == 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          item.isOpening == true ? clickLikeButton(item) : SizedBox(),
                          controller.obx(
                              (state) => Text(
                                    '${item.distance}KM' ?? '',
                                    style:
                                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'Pretendard'),
                                  ),
                              onLoading: const SizedBox())
                        ],
                      )
                    : item.isOpening == true
                        ? clickLikeButton(item)
                        : SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget clickLikeButton(Shop item) {
    return Obx(() => Align(
          alignment: Alignment.topRight,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              controller.isLike(item.index);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset('assets/app_06/star.png',
                        color: controller.shopItems.firstWhere((element) => element.index == item.index).isLike == true
                            ? Colors.red[400]
                            : null),
                  )),
            ),
          ),
        ));
  }
}
