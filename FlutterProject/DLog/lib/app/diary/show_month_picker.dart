import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locationdiary/app/common/show_toast.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';
import 'package:locationdiary/utils/logger.dart';
import 'package:locationdiary/utils/time_utils.dart';
import 'package:locationdiary/utils/utils_format.dart';

Future<DateTime?> showMonthPicker(DateTime originDateTime) async {
  DateTime onReadyDateTime = originDateTime;
  DateTime? resultDateTime;
  await Get.dialog(
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    List<List<DateTime>> dateListForTableWidget = List.generate(
        4,
        (index1) => List.generate(
            3,
            (index2) => DateTime(
                  onReadyDateTime.year,
                  3 * index1 + index2 + 1,
                )));
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const ImageIcon(
                  AssetImage(
                    "assets/icons/icon_month_picker_up_arrow.png",
                  ),
                  size: 44,
                  color: Color(0xffe1e1e1),
                ),
                onPressed: () {
                  setState(() {
                    onReadyDateTime = DateTime(onReadyDateTime.year - 1, 1, 1);
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                onReadyDateTime.year.toString(),
                style: AppTextStyles.heading2,
              ),
              //표 넣기
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 7, 20, 30),
                child: Table(
                  //border: TableBorder.all(),
                  children: List.generate(
                    4,
                    (rowIndex) => TableRow(
                      children: List.generate(
                          3,
                          (columnIndex) => InkWell(
                                onTap: () {
                                  //showToast('select month $rowIndex, $columnIndex');
                                  resultDateTime =
                                      dateListForTableWidget[rowIndex]
                                          [columnIndex];
                                  Get.back();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //몇월 달인지 적기
                                      Text(
                                        TimesFormat.toMonthMM(
                                            dateListForTableWidget[rowIndex]
                                                [columnIndex]),
                                        style: AppTextStyles.subtitle4
                                            .copyWith(color: AppColors.gray02),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      //달영어로 적기
                                      Text(
                                          TimesFormat.toMonthMMM(
                                                  dateListForTableWidget[
                                                      rowIndex][columnIndex])
                                              .toUpperCase(),
                                          style: AppTextStyles.heading4
                                              .copyWith(
                                                  color: AppColors.gray03)),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      isSameMonth(
                                              dateListForTableWidget[rowIndex]
                                                  [columnIndex],
                                              originDateTime)
                                          ? Divider(
                                              height: 2,
                                              thickness: 2,
                                              color: AppColors.darkGray01,
                                            )
                                          : SizedBox(
                                              height: 2,
                                            )
                                    ],
                                  ),
                                ),
                              )),
                    ),
                  ),
                ),
              ),

              Text(
                (onReadyDateTime.year + 1).toString(),
                style: AppTextStyles.heading2,
              ),
              SizedBox(
                height: 14,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    onReadyDateTime = DateTime(onReadyDateTime.year + 1, 1, 1);
                  });
                },
                icon: ImageIcon(
                  AssetImage(
                    "assets/icons/icon_month_picker_down_arrow.png",
                  ),
                  size: 44,
                  color: Color(0xffe1e1e1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }));
  logger.d('결과는 $resultDateTime');
  return resultDateTime;
}
