import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:matjipmemo/constants/app_colors.dart';
import 'package:matjipmemo/constants/common_size.dart';
import 'package:matjipmemo/constants/strings.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/review_model.dart';
import 'package:matjipmemo/pages/list/list_detail_controller.dart';
import 'package:matjipmemo/pages/place/review_input.dart';
import 'package:matjipmemo/tools/enums.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/view/widget/imageandindicator.dart';
import 'package:matjipmemo/view/widget/matjip_item/star_button_widget.dart';
import 'package:matjipmemo/view/widget/rounded_icon.dart';

class ListDetailPage extends GetView<ListDetailController> {
  const ListDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.listModel == null
        ? Scaffold(appBar: AppBar(), body: const Center(child: CircularProgressIndicator()))
        : WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(controller.listModel!.colorSet.backgroundColor),
                title: Text(
                  controller.listModel!.listName,
                  style: TextStyle(color: Color(controller.listModel!.colorSet.textColor)),
                ),
                actions: [_buildMoreButton(controller.listModel)],
                bottom: PreferredSize(
                    child: Container(
                      color: AppColors.mainColor,
                      height: 2,
                    ),
                    preferredSize: const Size.fromHeight(1)),
              ),
              body: Stack(
                children: [
                  ListView(
                    children: [
                      buildImage(),
                      buildDescription(),
                      buildPrice(), //나중에 예쁘게 UI 만들어 줄 것
                      buildIssueButton(),
                      buildMatjipItems(),
                      //하트 아이콘
                      buildHeartButton(),
                      buildListReviewLabel(),
                      _buildReviewInput(),
                      _buildReviewList(),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                  Visibility(
                      visible: controller.isProgressing,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ))
                ],
              ),
              backgroundColor: Color(controller.listModel!.colorSet.backgroundColor),
              floatingActionButton: Visibility(
                visible: (controller.listModel?.isPublished ?? true) == false,
                child: FloatingActionButton(
                  backgroundColor: Color(controller.listModel!.colorSet.backgroundColor),
                  onPressed: controller.onClickFloatingButton,
                  child: Icon(
                    Icons.add,
                    color: Color(controller.listModel!.colorSet.textColor),
                  ),
                  //elevation: 10,
                ),
              ),
            ),
          ));
  }

  Widget buildIssueButton() => Visibility(
        visible: controller.listModel?.isPublished == false && controller.isMine,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: controller.onClickIssueButton,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    backgroundColor: AppColors.mainColor,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text('발행하기'))),
        ),
      );

  Widget _buildReviewInput() {
    return Visibility(
      visible: controller.listModel?.isPublished ?? false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: commonGap),
        child: ReviewInput(
          onSubmitReview: controller.onSubmitReview,
          hintText: '작성해주세요'.tr,
        ),
      ),
    );
  }

  Padding _buildReviewList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: commonGap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildReviewCard(controller.myReview.value),
          ...List.generate(
            controller.otherReviews.length,
            (index) => _buildReviewCard(controller.otherReviews[index]),
          )
        ],
      ),
    );
  }

  Widget buildMatjipItems() {
    if (controller.isProgressing) {
      return SizedBox.shrink();
    }
    return (controller.matjipList.isEmpty)
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                '장소가 없습니다 😢\n장소를 추가해주세요',
                style: TextStyle(fontSize: 20, height: 2),
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(controller.matjipList.length, (index) => _buildMatjipItem(index)),
          );
  }

  Padding buildDescription() {
    return Padding(
      padding: EdgeInsets.only(left: controller.horizontalPadding, right: controller.horizontalPadding, bottom: 15),
      child: Text(
        controller.listModel!.description,
        style: TextStyle(color: Color(controller.listModel!.colorSet.textColor), fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildPrice() {
    ///0원일 경우 무료라고 하기!
    return Visibility(
      visible: controller.listModel!.writer.uid == controller.thisUserModel?.uid,
      child: Padding(
        padding: EdgeInsets.only(left: controller.horizontalPadding, right: controller.horizontalPadding, bottom: 15),
        child: controller.listModel!.price <= 0
            ? Text(
                '무료',
                style: TextStyle(color: Color(controller.listModel!.colorSet.textColor), fontSize: 17, fontWeight: FontWeight.w500),
              )
            : Row(
                children: [
                  Image.asset(ImageStrings.coinIcon, width: 25, height: 25),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    controller.listModel!.price.toString(),
                    style: TextStyle(color: Color(controller.listModel!.colorSet.textColor), fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildImage() {
    return (controller.listModel!.imageUrl?.isNotEmpty ?? false)
        ? Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  width: Get.width * 0.5,
                  child: CachedNetworkImage(
                    imageUrl: controller.listModel!.imageUrl!,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const ColoredBox(color: Colors.grey),
                  ),
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Widget buildHeartButton() {
    /// 내가 제작자이면 좋아요 숫자 보여주고 클릭하면 좋아요 누른 사람 몇 명인지 보여주는 리스트 보여주는 게 좋을 듯
    if (controller.listModel?.writer.uid == (controller.thisUserModel?.uid ?? 'anonymous')) {
      return SizedBox.shrink();
    }
    return !(controller.publicListModel?.post.listOfLikes ?? []).contains(controller.thisUserModel?.uid ?? 'anonymous')
        ? heartButton(onTap: () => controller.onClickHeartButton(isContain: false), iconAddress: "assets/icons/ic_heart.png", label: '이 글이 도움 되셨다면 추천을 눌러주세요!')
        : heartButton(onTap: () => controller.onClickHeartButton(isContain: true), iconAddress: "assets/icons/ic_heart_full.png", label: '추천 취소하기');
  }

  Padding heartButton({
    required VoidCallback onTap,
    required String iconAddress,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(iconAddress),
              color: AppColors.mainRedColor, //Colors.grey,
              size: 40,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 10),
              child: Text(
                label,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildMatjipItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: controller.horizontalPadding, right: controller.horizontalPadding, top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => controller.onClickMatjip(controller.matjipList[index]),
                          child: Text(
                            '${index + 1}. ${controller.matjipList[index].matjipName}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      if (controller.matjipList[index].starNum != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: StarButtonWidget(
                            tailHorizPadding: 0,
                            tailVertPadding: 0,
                            changeColor: Colors.amberAccent,
                            starNum: controller.matjipList[index].starNum.toString(),
                          ),
                        ),
                      // Spacer(),
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.matjipList[index].writer.uid == Get.find<LoginController>().userModel?.uid,
                  child: TextButton(
                      onPressed: () => controller.onClickPostModifyButton(index),
                      child: Text(
                        '수정'.tr,
                        style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.mainAccentColor),
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: controller.horizontalPadding, right: controller.horizontalPadding, bottom: 15),
            child: Text(
              '${controller.matjipList[index].description}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.3),
            ),
          ),
          ImageAndIndicator(
            controller.matjipList[index],
          ),
        ],
      ),
    );
  }

  Widget buildListReviewLabel() {
    return Visibility(
      visible: controller.listModel?.isPublished ?? false,
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 4, right: commonGap, left: commonGap),
            child: ImageIcon(
              AssetImage("assets/icons/ic_chat2.png"),
              color: Colors.grey,
              size: 24,
            ),
          ),
          Text(
            '리스트 리뷰',
            style: TextStyle(
              fontSize: 16,
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }

  PopupMenuButton<dynamic> _buildMoreButton(ListModel? listModel) {
    bool isMine = (controller.thisUserModel?.uid ?? 'noUser') == listModel?.writer.uid;
    logger.d('thisUserName : ${controller.thisUserModel?.name}\nwriter : ${listModel?.writer.name}');
    final double appBarHeight = AppBar().preferredSize.height;
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      tooltip: '더 보기',
      icon: Icon(
        Icons.more_horiz_outlined,
        color: AppColors.mainAccentColor,
      ),
      itemBuilder: (ctx) => [
        // if (listModel?.post.invisible == true && isMine)
        //   _buildPopupMenuItem(
        //     title: '발행',
        //     iconData: null,
        //     value: PopUpMenu.issue,
        //   ),
        _buildPopupMenuItem(
          title: '공유',
          iconData: null,
          value: PopUpMenu.share,
        ),
        if (listModel?.post.invisible == true && isMine)
          _buildPopupMenuItem(
            title: '수정',
            iconData: null,
            value: PopUpMenu.modify,
          ),
        if (isMine)
          _buildPopupMenuItem(
            title: '삭제',
            iconData: null,
            value: PopUpMenu.delete,
          ),
        if (!isMine)
          _buildPopupMenuItem(
            title: '신고',
            iconData: null,
            value: PopUpMenu.report,
          ),
      ],
      onSelected: (value) => controller.onSelectPopUpMenu(value),
      offset: Offset(0.0, appBarHeight),
    );
  }

  PopupMenuItem _buildPopupMenuItem({required String title, required IconData? iconData, required dynamic value}) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          if (iconData != null)
            Icon(
              iconData,
            ),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildReviewCard(ReviewModel? reviewModel) {
    if (reviewModel == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //프로필
          profileImageWithWriter(imgSize: iconSizeLL, replaceIcon: Icons.person, writer: reviewModel.writer),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: (reviewModel.contents.isNotEmpty ?? false) ? '${reviewModel.contents}   ' : '', style: const TextStyle(fontSize: 14, color: Colors.black87)),
                      const WidgetSpan(
                          child: ImageIcon(
                        AssetImage("assets/icons/ic_star.png"),
                        color: AppColors.starYellow,
                        size: 12,
                      )), //별
                      TextSpan(
                        text: (reviewModel.starNum ?? 3.0).toString(),
                        style: const TextStyle(fontSize: 12, color: AppColors.grey76),
                      ),
                      TextSpan(
                        text: DateFormat('   yy.MM.dd').format(reviewModel.created.toDate()),
                        style: const TextStyle(fontSize: 12, color: AppColors.grey76),
                      ),
                    ],
                    style: const TextStyle(
                      height: 1.2,
                    ),
                  ),
                ),
                const Visibility(
                  visible: false,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '신고하기',
                          style: TextStyle(fontSize: 12, color: AppColors.grey76),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
