import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/pages/list/my_list_blank_page.dart';
import 'package:matjipmemo/view/widget/circluar_text_stamp.dart';
import 'package:matjipmemo/view/widget/manage_matjip/thumb_image.dart';

import 'list_controller.dart';

class MyListPage extends StatelessWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    int listMaxLength = Get.find<LoginController>().userModel?.maxListLength ?? 10;
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Obx(() => Text('리스트'.tr + '(${Get.find<ListController>().listModelListObx.length}/$listMaxLength)')),
          bottom: PreferredSize(
              child: Container(
                color: AppColors.mainColor,
                height: 2,
              ),
              preferredSize: const Size.fromHeight(1)),
        ),
        body: GetBuilder<ListController>(
          builder: (listController) {
            return Obx(() => listController.listModelList.isEmpty
                ? const MyListBlankPage()
                : RefreshIndicator(
                    onRefresh: () => listController.getListList(),
                    child: ListView(
                      children: [
                        ...List.generate(
                            listController.listModelListObx.length,
                            (index) => GestureDetector(
                                  onLongPress: () => listController.onLongClickList(listController.listModelListObx[index]),
                                  onTap: () => listController.onClickList(index),
                                  child: Container(
                                    color: Color(listController.listModelListObx[index].colorSet.backgroundColor),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(left: 16.0, right: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listController.listModelListObx[index].listName,
                                                style: TextStyle(color: Color(listController.listModelListObx[index].colorSet.textColor), fontSize: 18, fontWeight: FontWeight.w500),
                                              ),
                                              if (listController.listModelListObx[index].description.isNotEmpty) ...[
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  listController.listModelListObx[index].description,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(color: Color(listController.listModelListObx[index].colorSet.textColor).withOpacity(0.7), fontSize: 15, fontWeight: FontWeight.w400),
                                                ),
                                              ]
                                            ],
                                          ),
                                        )),

                                        // ThumbImage((listController.listModelListObx.value[index].thumbUrl) ?? listController.listModelListObx.value[index].imageUrl!)
                                        SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Stack(
                                              children: [
                                                ThumbImage(listController.listModelListObx[index].thumbUrl ??
                                                    'https://firebasestorage.googleapis.com/v0/b/matjipmemo.appspot.com/o/Apptools%2FappIogo_final.png?alt=media&token=5a4cab1a-f3c8-4e3a-9714-2c35c0f2afed'),
                                                if (listController.listModelListObx[index].isPublished && listController.listModelList[index].writer.uid == listController.userModel?.uid) ...[
                                                  Container(width: double.maxFinite, height: double.maxFinite, color: Colors.white.withOpacity(0.5)),
                                                  CircularTextStamp(
                                                    text: '출시 됨',
                                                    radius: 50,
                                                    timeIndex: listController.listModelListObx[index].created.seconds,
                                                  )
                                                ]
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ));
          },
        ));
  }
}
