import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hanaromart/scrn/app_06/app06_controller.dart';
import 'package:hanaromart/scrn/app_06/component/region.dart';
import 'package:hanaromart/scrn/app_06/component/search_bar.dart';
import 'package:hanaromart/scrn/app_06/component/shop_list.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class ShopSearchScreen extends GetView<App06Controller> {
  const ShopSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '',
        body: ListView(
          padding: EdgeInsets.only(bottom: 20),
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomSearchBar(controller: controller),
            const SizedBox(
              height: 20,
            ),
            Obx(() => controller.addressModels.isNotEmpty ? Region(controller: controller) : SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
              child: listTitle(context),
            ),
            ShopList()
          ],
        ));
  }

  Widget listTitle(context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => Center(
                  child: Text.rich(TextSpan(
                      text: '총 ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                      children: [
                    TextSpan(
                      text: controller.filteredShopModels.length.toString(),
                      style: TextStyle(color: Color(0xff27675F)),
                    ),
                    TextSpan(
                      text: '개소',
                    )
                  ])))),
          Obx(() => PopupMenuButton(
                onSelected: (value) {
                  int index = controller.filters.indexWhere((element) => element == value);
                  controller.filtering(index);
                },
                child: Container(
                    height: 30,
                    width: 80,
                    padding: EdgeInsets.only(left: 1, right: 1),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[700]!, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(controller.filterText.value,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Pretendard')),
                        const SizedBox(
                          width: 3,
                        ),
                        Image.asset("assets/app_06/Vector.png")
                      ],
                    )),
                itemBuilder: (_) {
                  return controller.filters
                      .map((e) => PopupMenuItem(
                            child: Text(e,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Pretendard')),
                            value: e,
                          ))
                      .toList();
                },
              ))
        ],
      ),
    );
  }
}
