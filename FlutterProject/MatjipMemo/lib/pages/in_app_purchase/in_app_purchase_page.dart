import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/constants/strings.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/pages/in_app_purchase/in_app_purcase_controller.dart';
import 'package:matjipmemo/pages/in_app_purchase/refund/refund_page.dart';
import 'package:matjipmemo/route/get_parameters.dart';

import '../../route/router_name.dart';

class InAppPurchasePage extends GetView<InAppPurchaseController> {
  const InAppPurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스토어'),
        centerTitle: false,
        actions: [buildGoldButton()],
        bottom: PreferredSize(
            child: Container(
              color: AppColors.mainColor,
              height: 2,
            ),
            preferredSize: const Size.fromHeight(1)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: controller.loadingProductForSale(),
              builder: (BuildContext context, AsyncSnapshot<List<ProductDetails>> snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                List<ProductDetails> productList = snapshot.data!;
                return Stack(
                  children: [
                    ListView(
                      children: [
                        ...List.generate(productList.length, (index) => _buildListTile(productList[index])),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                '청약 철회는 구매일로부터 7일 이내 가능합니다.',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.addLog('onClick refund');
                                  Get.to(() => RefundPage());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                                  child: Text(
                                    '문의하기',
                                    style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey[600]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Visibility(
                        visible: controller.purchasePending,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                  ],
                );
              },
            ),
          ),
          Visibility(
            visible: controller.isLog,
            child: Expanded(
                flex: 1,
                child: Obx(() => ListView(
                      children: controller.logList.map((element) => Text(element)).toList(),
                    ))),
          )
        ],
      ),
    );
  }

  Widget _buildListTile(ProductDetails productDetails) {
    List<String> idSplit = productDetails.id.split('_');
    if (idSplit.length < 2 || idSplit[0] != 'gold') {
      return SizedBox.shrink();
    }
    return InkWell(
      onTap: () => controller.onClickPurchaseItem(productDetails),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              ImageStrings.coinIcon,
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              idSplit[1],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            Spacer(),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.black87, foregroundColor: Colors.grey[50]),
                onPressed: () => controller.onClickPurchaseItem(productDetails),
                child: SizedBox(
                    width: 110,
                    child: Center(
                      child: Text(productDetails.price),
                    )))
          ],
        ),
      ),
    );
  }

  Widget buildGoldButton() {
    return Obx(() => TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
        onPressed: () {
          if (Get.find<LoginController>().userModel == null) {
            Get.find<LoginController>().doLogin();
            return;
          } else {
            ///정산버튼 off
            Get.toNamed(Routes.Gold, parameters: {GetParameters.hideCalculate: 'true'});
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 7.0),
          child: Row(
            children: [
              Image.asset(
                ImageStrings.coinIcon,
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                (Get.find<LoginController>().userModel?.gold.toInt() ?? 0).toString(),
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        )));
  }
}
