import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/data/models/shop.dart';
import 'package:hanaromart/scrn/app_07/app07_controller.dart';
import 'package:hanaromart/widgets/custom_widget.dart';

class ShopDetailWidget extends StatelessWidget {
  final Shop item;
  final App07Controller controller;
  const ShopDetailWidget({super.key, required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomWidget().withIconText(0, item.name),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomWidget().withIconText(1, item.number),
              controller.obx(
                  (state) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          controller.distance.value == '' ? '' : '${controller.distance.value}KM',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, fontFamily: "Pretendard"),
                        ),
                      ),
                  onLoading: const SizedBox())
            ],
          ),
        ],
      ),
    );
  }
}
