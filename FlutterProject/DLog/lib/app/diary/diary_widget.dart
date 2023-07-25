import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:locationdiary/app/diary/diary_controller.dart';
import 'package:locationdiary/app/main/main_controller.dart';
import 'package:locationdiary/app/post/post_page.dart';
import 'package:locationdiary/data/models/response/diary_model_res.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/utils/utils_format.dart';

class DiaryWidget extends StatefulWidget {
  const DiaryWidget(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  State<DiaryWidget> createState() => _DiaryWidgetState();
}

class _DiaryWidgetState extends State<DiaryWidget> {
  GlobalKey key = GlobalKey();
  bool openOptions = false;
  File? imgFile;

  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    final diaries = Get.put(DiaryController()).diaries;
    final diary = diaries[widget.index];
    OverlayState? overlayState = Overlay.of(context);

    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 17, 9),
        child: GetBuilder<DiaryController>(builder: (diaryController) {
          return Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/icon_watch.png',
                    height: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    TimesFormat.dateTimeFormat(diary.dateTime),
                    style: AppTextStyles.body3
                        .copyWith(color: AppColors.darkGray01),
                  ),
                  const SizedBox(width: 10),
                  (diary.diaryGps?.name != null && diary.diaryGps?.name != '')
                      ? Expanded(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/icon_map.png',
                                height: 16,
                              ),
                              const SizedBox(width: 6),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  diary.diaryGps!.name,
                                  style: AppTextStyles.body3
                                      .copyWith(color: AppColors.darkGray01),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Expanded(
                          child: SizedBox(),
                        ),
                  GestureDetector(
                    key: key,
                    onTap: () {
                      double offsetY = _calcOffsetY();
                      setState(
                        () {
                          if (diaryController.scrollPhysics !=
                              const NeverScrollableScrollPhysics()) {
                            diaryController.blockScroll(!openOptions);
                            diaryController.setOverlayEntry(
                                _createOverlay(diary, offsetY));
                            overlayState!.insert(diaryController.overlayEntry!);
                            diaryController.setHasOpened(true);
                          } else {
                            diaryController.blockScroll(false);
                            diaryController.deleteOverlayEntry();
                            diaryController.setHasOpened(false);
                          }
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/icons/icon_3_dot.png',
                      width: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Row(
                    children: [
                      VerticalDivider(
                        thickness: 1,
                        width: 16,
                        color: widget.index != (diaries.length - 1)
                            ? AppColors.systemBlack10
                            : Colors.transparent,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            diary.bodyText == ''
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      const SizedBox(height: 2),
                                      Text(
                                        diary.bodyText,
                                        style: AppTextStyles.body2,
                                      ),
                                      const SizedBox(height: 7),
                                    ],
                                  ),
                            diary.diaryResource?.imgUrl == '' ||
                                    diary.diaryResource?.imgUrl == null
                                ? const SizedBox()
                                : Column(
                                    children: [
                                      const SizedBox(height: 7),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: FutureBuilder<File>(
                                          future: diaryController.getImage(
                                              diary.diaryResource!.imgUrl),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<File> snapshot) {
                                            if (snapshot.hasData) {
                                              imgFile = snapshot.data;
                                              return snapshot.data == null
                                                  ? const Text('null')
                                                  : Image.file(
                                                      snapshot.data!,
                                                      width: double.infinity,
                                                      fit: BoxFit.fitWidth,
                                                    );
                                            } else if (snapshot.hasError) {
                                              return const SizedBox();
                                            } else {
                                              return SizedBox(
                                                width: double.infinity,
                                                height: 200,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  color:
                                                      AppColors.systemBlack60,
                                                )),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // 클릭하면 열릴 화면
  OverlayEntry _createOverlay(DiaryModelRes diary, double offsetY) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        top: 26,
        right: 3,
        child: CompositedTransformFollower(
          offset: Offset(size.width - 270, offsetY),
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            color: Colors.transparent,
            child: GetBuilder<DiaryController>(
              builder: (diaryController) {
                diaryController.setHasOpened(true);

                return Container(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  width: 250,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.systemWhite,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        color: AppColors.systemBlack10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GetBuilder<MainController>(
                        builder: (mainController) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                openOptions = false;
                                diaryController.setHasOpened(false);
                              });
                              diaryController.deleteOverlayEntry();
                              diaryController.blockScroll(false);
                              if (diary.diaryResource?.imgUrl == '') {
                                imgFile = null;
                              }
                              Get.to(
                                () => PostPage(
                                  isEdit: true,
                                  bodyText: diary.bodyText,
                                  dateTime: diary.dateTime,
                                  placeName: diary.diaryGps!.name,
                                  imgFile: imgFile,
                                  diarySeq: diary.diarySeq,
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                              child: Text(
                                '수정하기',
                                style: AppTextStyles.body1
                                    .copyWith(color: AppColors.systemBlack),
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(
                        thickness: 1,
                        height: 10,
                        color: AppColors.systemBlack10,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            openOptions = false;
                            diaryController.setHasOpened(false);
                            diaryController.deleteOverlayEntry();
                          });
                          diaryController.blockScroll(false);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('글 삭제하기'),
                                content: const Text(
                                    '작성한 글을 삭제할까요?\n삭제한 글은 다시 되돌릴 수 없습니다!'),
                                actions: [
                                  TextButton(
                                    child: const Text('삭제'),
                                    onPressed: () {
                                      diaryController.deleteDiary(
                                        diarySeq: diary.diarySeq,
                                      );
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('취소'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                          child: Text(
                            '삭제하기',
                            style: AppTextStyles.body1
                                .copyWith(color: AppColors.systemBlack),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  double _calcOffsetY() {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double positionY = position.dy;

    double screenHeight = MediaQuery.of(context).size.height;
    logger.i('y의 위치는? ${screenHeight - positionY}');

    double yFromBottom = screenHeight - positionY;

    if (yFromBottom < 244) {
      return yFromBottom - 220;
    } else {
      return 24;
    }
  }
}
