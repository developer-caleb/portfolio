import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/pages/list/widget/list_image.dart';
import 'package:matjipmemo/view/widget/bottom_sheet_bar.dart';

Future<bool> listPurchaseBottomSheet({required ListModel listModel, required BuildContext context}) async {
  return await showModalBottomSheet<bool>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          //  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              //  height: 3000,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: BottomSheetBar(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(width: 100, height: 100, child: ListImage(listModel: listModel)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      listModel.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          '리스트를 구매하시겠어요?',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () => Get.back(result: true),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '구매',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 2),
                              child: Image.asset(
                                'assets/icons/ic_coin32.png',
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Text(
                              listModel.price.toString(),
                              style: TextStyle(),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: AppColors.mainColor, padding: EdgeInsets.symmetric(vertical: 13)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            '다음에 할게요',
                            style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w800, fontSize: 15),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }) ??
      false;
}
