import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/constants/common_size.dart';
import 'package:matjipmemo/models/firebase/color_set.dart';
import 'package:matjipmemo/pages/list/write_list_controller.dart';
import 'package:matjipmemo/tools/enums.dart';
import 'package:matjipmemo/tools/logger.dart';

class WriteListPage extends GetView<WriteListController> {
  const WriteListPage({super.key});

  final double fontSize = 16;

  final TextStyle listWriteStyle = const TextStyle(fontSize: 16, color: AppColors.grey76);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.originList == null ? '리스트 제작' : '리스트 수정'),
        bottom: PreferredSize(
            child: Container(
              color: AppColors.mainColor,
              height: 2,
            ),
            preferredSize: const Size.fromHeight(1)),
        actions: [
          TextButton(
              onPressed: controller.onClickSaveButton,
              child: Obx(() => Text(
                    controller.originList == null ? '저장'.tr : '수정'.tr,
                    style: TextStyle(color: controller.inputTitleText.isEmpty ? Colors.grey : Colors.blue, fontWeight: FontWeight.w600),
                  )))
        ],
      ),
      body: FutureBuilder(
          future: controller.fetchColorList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return CustomScrollView(
                slivers: [
                  _buildTitle(),
                  _buildDescription(),
                  _buildCoverImg(),

                  //Text('공개'),
                  ///공개는 버튼이 나중에 나오는데, 추가를 다하고 나서 공개하는 걸로!
                  colorPalletLabel(),
                  ColorPallet(),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: commonGap,
                          ),
                        ],
                      ),
                    ),
                  ),

                  _buildPrice(),
                  _buildUploadType(),
                ],
              );
            }
          }),
    );
  }

  SliverPadding colorPalletLabel() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '배경색',
              style: listWriteStyle,
            ), //기본은 흰색이다 - eatrip을 기존에 사용했던 사용자는 red, //#FFB7AD
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildDescription() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '설명'.tr,
                  style: const TextStyle(fontSize: 16, color: AppColors.grey76),
                ),
                Obx(() => Text(
                      '${controller.inputDescriptionText.length}/${controller.maxContentsLength}',
                      style: const TextStyle(fontSize: 14, color: AppColors.grey76),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLength: 300,
              minLines: 3,
              maxLines: 7,
              controller: controller.descriptionEditController,
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverPadding _buildUploadType() {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 10, bottom: 30),
      sliver: SliverToBoxAdapter(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///종류는 저장할 때 자동적으로 확인해서 field에 넣도록하자!
          Text(
            '종류',
            style: listWriteStyle,
          ), //기본은 흰색이다 - eatrip을 기존에 사용했던 사용자는 red, //#FFB7AD
          const SizedBox(
            height: 10,
          ),
          Row(
            children: controller.originList != null
                ? [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          controller.postMode.info,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
                          backgroundColor: MaterialStateProperty.all(controller.postMode.postModeColor),
                        ))
                  ]
                : [
                    buildTextButton(text: '맛집', postMode: PostMode.eat),
                    const SizedBox(
                      width: 10,
                    ),
                    buildTextButton(
                      text: '여행',
                      postMode: PostMode.trip,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    buildTextButton(
                      text: '맛집 & 여행',
                      postMode: PostMode.eatrip,
                    ),
                  ],
          ),
          const SizedBox(
            height: commonGap,
          ),
        ],
      )),
    );
  }

  Widget _buildPrice() {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///종류는 저장할 때 자동적으로 확인해서 field에 넣도록하자!
          Row(
            children: [
              Text(
                '가격',
                style: listWriteStyle,
              ),
              InkWell(
                  onTap: () {
                    Get.dialog(AlertDialog(
                      content: Text(
                        '리스트를 판매할 때의 가격입니다😀 \n\n레벨이 증가할수록 가격을 높일 수 있어요! \n\n현재레벨 : ${controller.userModel.level}\n최대금액 : ${controller.maxPrice}원',
                        style: TextStyle(fontSize: 17),
                      ),
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      CupertinoIcons.question_circle,
                      color: Colors.grey,
                    ),
                  ))

              ///?버튼 눌르면 위에 말풍선 생기는 버튼
            ],
          ), //기본은 흰색이다 - eatrip을 기존에 사용했던 사용자는 red, //#FFB7AD

          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: controller.priceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+')),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                ),
              ),
              Text('원'),
              Text(
                ' (최대 ${controller.maxPrice}원)',
                style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: commonGap,
          ),
        ],
      ),
    ));
  }

  SliverPadding _buildCoverImg() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '표지사진',
            style: listWriteStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          buildSelectImg(),
          const SizedBox(
            height: commonGap,
          ),
        ],
      )),
    );
  }

  SliverPadding _buildTitle() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              '제목',
              style: listWriteStyle,
            ),
            TextField(
              controller: controller.titleEditController,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: commonGap,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextButton({required String text, required PostMode postMode}) => Obx(() => TextButton(
        onPressed: () => controller.onClickPostMode(postMode),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
            backgroundColor: controller.postMode == postMode ? MaterialStateProperty.all(AppColors.mainColor) : MaterialStateProperty.all(Colors.grey[400]!)),
      ));

/*  Widget buildPalette() {
    return Wrap(
      children: [
        InkWell(
          onTap: controller.onClickPallet,
          child: Container(
            height: 35 + commonGap,
            width: 35 + commonGap,
            decoration: BoxDecoration(
                color: const Color(0xFFFFB7AD),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 8)),
          ),
        ),
      ],
    );
  }*/

  Widget buildSelectImg() {
    return Wrap(
      children: [
        InkWell(
          onTap: controller.onClickCoverImg,
          child: Container(
            height: 100 + commonGap,
            width: 100 + commonGap,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey[300]!, width: 2)),
            child: Obx(() => controller.imageFile != null
                ? AspectRatio(
                    aspectRatio: 1,
                    child: ExtendedImage.file(
                      controller.imageFile!,
                      fit: BoxFit.fill,
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                    ))
                : controller.webImg != null
                    ? CachedNetworkImage(imageUrl: controller.webImg!)
                    : const Icon(
                        CupertinoIcons.camera,
                        color: Colors.black26,
                      )),
          ),
        ),
      ],
    );
  }
}

class ColorPallet extends StatefulWidget {
  const ColorPallet({super.key});

  @override
  State<ColorPallet> createState() => _ColorPalletState();
}

class _ColorPalletState extends State<ColorPallet> {
  List<ColorSet> colors = [ColorSet(backgroundColor: Colors.white.value, textColor: Colors.black87.value)];

  bool showColorList = false;

  @override
  void initState() {
    Get.find<WriteListController>().selectedColor = Get.find<WriteListController>().originList == null ? colors.first : Get.find<WriteListController>().originList!.colorSet;
    colors.addAll(Get.find<WriteListController>().colorList);
    logger.d('colors $colors, colorList ${Get.find<WriteListController>().colorList} ');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 0, //수평 Padding
          crossAxisSpacing: 0, //수직 Padding
        ),
        delegate: SliverChildListDelegate([
          InkWell(
            onTap: () {
              logger.d('onClickPallet');
              setState(() {
                showColorList = !showColorList;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Container(
                decoration: BoxDecoration(color: Color(Get.find<WriteListController>().selectedColor.backgroundColor), shape: BoxShape.circle, border: Border.all(color: Colors.grey[400]!, width: 8)),
              ),
            ),
          ),
          if (showColorList)
            ...colors.map((e) => InkWell(
                  onTap: () {
                    logger.d('onClickPallet');
                    logger.d('selectedColor is ${e.backgroundColor}');
                    setState(() {
                      Get.find<WriteListController>().selectedColor = e;
                      showColorList = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Container(
                      // margin: const EdgeInsets.only(left: 4.0, right: 4),
                      decoration: BoxDecoration(
                        color: Color(e.backgroundColor),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[400]!, width: 2),
                      ),
                    ),
                  ),
                ))
        ]),
      ),
    );
  }
}
