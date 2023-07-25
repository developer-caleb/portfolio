import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:get/get.dart';

import 'package:locationdiary/app/common/show_toast.dart';
import 'package:locationdiary/app/diary/diary_controller.dart';
import 'package:locationdiary/app/main/main_controller.dart';
import 'package:locationdiary/app/post/post_controller.dart';
import 'package:locationdiary/data/dto/model/four_square_venue_dto.dart';
import 'package:locationdiary/route/router_name.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/utils/permissions.dart';
import 'package:locationdiary/utils/utils_format.dart';

class PostPage extends StatefulWidget {
  PostPage({
    this.isEdit = false,
    this.bodyText = '',
    this.dateTime = '',
    this.placeName,
    this.imgFile,
    this.diarySeq,
    super.key,
  });

  bool isEdit;
  String bodyText;
  String dateTime;
  String? placeName;
  File? imgFile;
  int? diarySeq;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  FourSquareVenueDto? mySelectedVenue;
  final TextEditingController _textEditingController = TextEditingController();
  DateTime selectedDateTime = DateTime.now();
  String? placeName;
  final FocusNode _feedFocusNode = FocusNode();
  Picker? picker;
  bool isLoading = false;

  String get dateTimeForRequest =>
      TimesFormat.toDateTimeForRequest(selectedDateTime);

  @override
  void initState() {
    if (widget.isEdit) {
      final postController = Get.put<PostController>(PostController());
      _textEditingController.text = widget.bodyText;
      final dt = widget.dateTime;
      selectedDateTime = DateTime.parse(
          '${dt.substring(0, 4)}-${dt.substring(4, 6)}-${dt.substring(6, 8)}T${dt.substring(8, 10)}:${dt.substring(10, 12)}:${dt.substring(12)}');
      placeName = widget.placeName;
      postController.setImageFile(widget.imgFile);
    }

    super.initState();
    Future.microtask(() => _feedFocusNode.requestFocus());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _feedFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postController = Get.put<PostController>(PostController());

    return GestureDetector(
      onTap: () {
        _feedFocusNode.unfocus();
        //showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate)
      },
      child: Scaffold(
        body: SafeArea(
          child: isLoading
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20,
                      ),
                      widget.isEdit
                          ? const Text('다이어리를 수정하는 중')
                          : const Text('다이어리를 저장하는 중'),
                    ],
                  ),
                )
              : GetBuilder<PostController>(
                  builder: (postController) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                          height: 44,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                      'assets/icons/icon_close.png'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  ///여기가 왜 no appbar인지 확인
                                  await showDiaryDatePicker(context);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      TimesFormat.toDateStrDot(
                                          selectedDateTime),
                                      style: AppTextStyles.body2.copyWith(
                                          color: AppColors.systemBlack),
                                    ),
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Image.asset(
                                          'assets/icons/icon_arrow.png'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 24),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              if (_feedFocusNode.hasFocus)
                                {_feedFocusNode.unfocus()}
                              else if (postController.imageFile == null)
                                {_feedFocusNode.requestFocus()}
                            },
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 7, 0, 0),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await showDiaryTimePicker(context);
                                            //showToast(selectValue);
                                            //showTimePicker(context: context, initialTime: TimeOfDay(hour: nowTime.hour, minute: nowTime.minute));
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 5, 8),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/icon_watch.png',
                                                  height: 16,
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  TimesFormat.toTimeStrHHMMA(
                                                      selectedDateTime),
                                                  style: AppTextStyles.body3
                                                      .copyWith(
                                                          color: AppColors
                                                              .darkGray01),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            bool permission =
                                                await checkLocationPermission();
                                            if (permission) {
                                              dynamic selectedVenue =
                                                  await Get.toNamed(
                                                      Routes.locationPage);
                                              if (selectedVenue != null &&
                                                  selectedVenue
                                                      is FourSquareVenueDto) {
                                                setState(() {
                                                  mySelectedVenue =
                                                      selectedVenue;
                                                  placeName =
                                                      mySelectedVenue!.name;
                                                });
                                              } else {
                                                setState(() {
                                                  mySelectedVenue = null;
                                                });
                                              }
                                            } else {
                                              // return showToast('위치 사용권한을 허용해주세요');
                                            }
                                          },
                                          child: mySelectedVenue != null ||
                                                  (placeName != null &&
                                                      placeName != '')
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 8, 8, 8),
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
                                                          placeName!,
                                                          style: AppTextStyles
                                                              .body3
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .darkGray01),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 8, 8, 8),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/icon_map_nodata.png',
                                                        height: 16,
                                                      ),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        '위치도 추가해 보세요',
                                                        style: AppTextStyles
                                                            .body3
                                                            .copyWith(
                                                                color: AppColors
                                                                    .lightGray05),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 8, 20, 16),
                                    alignment: Alignment.topLeft,
                                    child: Form(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller: _textEditingController,
                                            focusNode: _feedFocusNode,
                                            onChanged: (text) =>
                                                setState(() {}),
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: '무슨 생각 하세요?',
                                              hintStyle: AppTextStyles.body2
                                                  .copyWith(
                                                      color: AppColors.gray01),
                                            ),
                                            style: AppTextStyles.body2.copyWith(
                                                color: AppColors.systemBlack),
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                          ),
                                          const SizedBox(height: 14),
                                          postController.imageFile != null
                                              ? Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.file(
                                                        postController
                                                            .imageFile!,
                                                        width: double.infinity,
                                                        // 이미지 너비가 큰 경우 적용
                                                        fit: BoxFit
                                                            .fitWidth, // 이미지 너비가 작은 경우 적용
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 10,
                                                      right: 10,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          postController
                                                              .cancelImage();
                                                          _feedFocusNode
                                                              .requestFocus();
                                                        },
                                                        child: SizedBox(
                                                          height: 24,
                                                          width: 24,
                                                          child: Image.asset(
                                                              'assets/icons/icon_delete.png'),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightGray01,
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: AppColors.systemBlack10,
                              ),
                            ),
                          ),
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (postController.imageFile == null) {
                                    bool permissioncheck =
                                        await checkImagePermission();
                                    if (!permissioncheck) {
                                      return logger.e('이미지 허가 되지 않음');
                                    }
                                    _feedFocusNode.unfocus();
                                    postController.selectImage();
                                  } else {
                                    showToast('사진은 아직 한 장만 추가 가능합니다.');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                        'assets/icons/icon_image_plus.png'),
                                  ),
                                ),
                              ),
                              _textEditingController.text == '' &&
                                      postController.imageFile == null
                                  // 사진 또는 텍스트 둘중 하나라도 빈 경우 저장 버튼 비활성화(회색 바탕)
                                  ? GestureDetector(
                                      onTap: () {
                                        showToast('사진 또는 텍스트를 입력해야 합니다.');
                                      },
                                      behavior: HitTestBehavior.opaque,
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 3, 8, 3),
                                        width: 54,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.lightGray03,
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.isEdit ? '수정' : '저장',
                                            style: AppTextStyles.subtitle1
                                                .copyWith(
                                                    color:
                                                        AppColors.lightGray05),
                                          ),
                                        ),
                                      ),
                                    )
                                  // 사진 또는 텍스트 둘중 하나라도 입력한 경우 저장 버튼 활성화(검정 바탕, 흰 글씨)
                                  : GetBuilder<DiaryController>(
                                      builder: (diaryController) {
                                        return GetBuilder<MainController>(
                                          builder: (mainController) {
                                            return GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                final dateTime = TimesFormat
                                                    .toDateTimeForRequest(
                                                        selectedDateTime);
                                                widget.isEdit
                                                    ? await postController
                                                        .amendDiary(
                                                        dateTime: dateTime,
                                                        bodyText:
                                                            _textEditingController
                                                                .text,
                                                        placeName:
                                                            placeName ?? '',
                                                        diarySeq:
                                                            widget.diarySeq,
                                                      )
                                                    : await postController
                                                        .saveDiary(
                                                        dateTime: dateTime,
                                                        bodyText:
                                                            _textEditingController
                                                                .text,
                                                        placeName:
                                                            placeName ?? '',
                                                      );
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                diaryController.fetchDiaries(
                                                  writeDate: selectedDateTime,
                                                );
                                                diaryController.setSelectedDate(
                                                  selectedDateTime,
                                                );
                                                mainController
                                                    .changeTabIndex(0);
                                                Get.back();
                                              },
                                              behavior: HitTestBehavior.opaque,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 3, 8, 3),
                                                width: 54,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors.darkGray01,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    widget.isEdit ? '수정' : '저장',
                                                    style: AppTextStyles
                                                        .subtitle1
                                                        .copyWith(
                                                      color:
                                                          AppColors.systemWhite,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future showDiaryTimePicker(BuildContext context) async {
    picker = Picker(
      hideHeader: true,
      cancel: const SizedBox.shrink(),
      confirm: GestureDetector(
          onTap: () {
            if (picker != null) {
              picker!.onConfirm?.call(picker!, picker!.selecteds);
            } else {
              logger.e('Picker is null, somethings are wrong');
            }
            Get.back();
          },
          child: const ConfirmButton()),
      adapter: DateTimePickerAdapter(
          value: selectedDateTime,
          minuteInterval: 5,
          type: PickerDateTimeType.kHM_AP),
      title: const Text("시간 선택"),
      selectedTextStyle:
          TextStyle(color: AppColors.systemBlack, fontWeight: FontWeight.w700),
      onConfirm: pickerConfirmCallback,
    );
    await picker?.showDialog(context);
  }

  pickerConfirmCallback(Picker picker, List value) {
    logger.d('onConfirm');
    setState(() {
      selectedDateTime =
          (picker.adapter as DateTimePickerAdapter).value ?? selectedDateTime;
    });
    logger.d(selectedDateTime);
  }

  void pickerOnConfirm() {
    if (picker != null) {
      picker!.onConfirm?.call(picker!, picker!.selecteds);
    } else {
      logger.e('Picker is null, somethings are wrong');
    }
  }

  Future showDiaryDatePicker(BuildContext context) async {
    picker = Picker(
        hideHeader: true,
        cancel: const SizedBox.shrink(),
        confirm: GestureDetector(
          onTap: () {
            if (picker != null) {
              picker!.onConfirm?.call(picker!, picker!.selecteds);
            } else {
              logger.e('Picker is null, somethings are wrong');
            }
            Get.back();
          },
          child: const ConfirmButton(),
        ),
        adapter: DateTimePickerAdapter(
          type: PickerDateTimeType.kYMD,
          value: selectedDateTime,
          isNumberMonth: true,
          yearSuffix: "년",
          monthSuffix: "월",
          daySuffix: "일",
        ),
        title: const Text("날짜 선택"),
        selectedTextStyle: TextStyle(
            color: AppColors.systemBlack, fontWeight: FontWeight.w700),
        onConfirm: pickerConfirmCallback);
    await picker?.showDialog(context);
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColors.darkGray01, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          '확인',
          style: AppTextStyles.button1.copyWith(color: AppColors.systemWhite),
        ),
      ),
    );
  }
}
