import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locationdiary/app/diary/diary_controller.dart';
import 'package:locationdiary/app/diary/diary_widget.dart';
import 'package:locationdiary/app/diary/show_month_picker.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/utils/time_utils.dart';
import 'package:locationdiary/utils/utils_format.dart';

class DiaryPage extends StatefulWidget {
  DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final diaryController = Get.put<DiaryController>(DiaryController());
  List<DateTime> dateTimeList = [];
  ScrollController? dayPickerScroller;
  double dayPickerWidth = 46.0;

  @override
  void initState() {
    super.initState();
    generateTimeList(diaryController.selectedDate);
    dayPickerScroller = ScrollController(
        initialScrollOffset: max(
            0, (diaryController.selectedDate.day - 0.5) * dayPickerWidth - Get.width * 0.5));
    //scroll 은 어떻게? index scroll하면 됨,,
  }

  @override
  void dispose() {
    dayPickerScroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: () async {
            if (diaryController.hasOpened) {
              diaryController.deleteOverlayEntry();
              diaryController.blockScroll(false);
              diaryController.setHasOpened(false);
            }

            DateTime? resultTime = await showMonthPicker(diaryController.selectedDate);
            if (resultTime != null) {
              setState(() {
                diaryController.setSelectedDate(resultTime);
                generateTimeList(diaryController.selectedDate);
                dayPickerScroller?.jumpTo(0);
                Get.find<DiaryController>()
                    .fetchDiaries(writeDate: diaryController.selectedDate);
              });
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                TimesFormat.toDateStrDotYYYYMM(diaryController.selectedDate),
                style: AppTextStyles.heading2,
              ),
              const SizedBox(
                width: 4,
              ),
              const ImageIcon(
                AssetImage(
                  "assets/icons/icon_arrow.png",
                ),
                color: Color(0xffe1e1e1),
                size: 24,
              ),
            ],
          ),
        ),
      ),
      body: GetBuilder<DiaryController>(builder: (diaryController) {
        return Column(
          children: [
            SizedBox(
              height: 56,
              child: ListView.builder(
                controller: dayPickerScroller,
                itemCount: dateTimeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  bool selected = diaryController.selectedDate.day == (index + 1);
                  return InkWell(
                    onTap: () {
                      if (diaryController.hasOpened) {
                        diaryController.deleteOverlayEntry();
                        diaryController.blockScroll(false);
                        diaryController.setHasOpened(false);
                      }

                      setState(() {
                        diaryController.setSelectedDate(DateTime(
                            diaryController.selectedDate.year, diaryController.selectedDate.month, index + 1));
                        Get.find<DiaryController>()
                            .fetchDiaries(writeDate: diaryController.selectedDate);
                      });
                    },
                    child: SizedBox(
                      width: dayPickerWidth,
                      height: 56,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  isToday(dateTimeList[index])
                                      ? '오늘'
                                      : getStringFromWeekday(
                                          dateTimeList[index].weekday),
                                  style: AppTextStyles.subtitle3.copyWith(
                                      color: selected
                                          ? AppColors.systemBlack
                                          : AppColors.lightGray05),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  dateTimeList[index].day.toString(),
                                  style: AppTextStyles.heading3.copyWith(
                                      color: selected
                                          ? AppColors.systemBlack
                                          : AppColors.lightGray05),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          if (selected)
                            const Divider(
                              thickness: 3,
                              height: 3,
                              color: Colors.black87,
                              indent: 12,
                              endIndent: 12,
                            )
                          else
                            const SizedBox(
                              height: 3,
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(height: 0.5, thickness: 0.5, color: AppColors.systemBlack10,),
            //Deprecated 22.07.15 앱 디자인과 맞지 않아서 않음//
            /*DatePicker(
              DateTime.now(),
              initialSelectedDate: selectedTime,
              selectionColor: Colors.black,
              locale: 'ko_kr',
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  //_selectedValue = date;
                });
              },
            ),*/
            diaryController.diaries.isEmpty
                ? emptyFeedSection()
                : feedSection(),
          ],
        );
      }),
    );
  }

  // 피드가 하나도 없는 경우에 보여줄 화면
  Container emptyFeedSection() {
    return Container(
      margin: const EdgeInsets.only(
        top: 165,
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/icons/icon_main_empty.png',
            width: 120,
          ),
          SizedBox(
            height: 49,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '첫 글을 기록해 보세요!',
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.gray01,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '무슨 생각 하세요?',
                  style: AppTextStyles.body1.copyWith(
                    color: AppColors.gray01,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 피드가 하나라도 있는 경우에 보여줄 화면
  Expanded feedSection() {
    return Expanded(
      child: GetBuilder<DiaryController>(
        builder: (diaryController) {
          return GestureDetector(
            onTap: () {
              diaryController.blockScroll(false);
              diaryController.deleteOverlayEntry();
            },
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(), // 스크롤 끝단 기본 효과(glow) 제거
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: diaryController.total,
                physics: diaryController.scrollPhysics,
                itemBuilder: (BuildContext context, int index) {
                  return DiaryWidget(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void generateTimeList(DateTime dateTime) {
    dateTimeList = List.generate(
      getDayOfMonth(dateTime),
      (index) => DateTime.utc(
        dateTime.year,
        dateTime.month,
        1 + index,
      ),
    );
    logger.d('generatedTimeList => ${dateTimeList.toString()}');
  }
}
