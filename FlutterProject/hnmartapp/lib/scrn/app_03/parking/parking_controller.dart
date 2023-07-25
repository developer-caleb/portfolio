import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hanaromart/tools/toast.dart';
import 'package:hanaromart/widgets/custom_text.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParkingController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    carNumList.value = pref.getStringList('carNum') ?? [];
    print(carNumList);
    // pref.clear();
  }

  RxList<String> carNumList = <String>[].obs;
  RxString carNum = ''.obs;
  var car_controller = TextEditingController();
  RxBool text_error = false.obs;

  carNumListAdd() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    carNumList.add(carNum.value);
    pref.setStringList('carNum', carNumList);
    car_controller.clear();
    carNum.value = '';
  }

  carNumListremove(index) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    carNumList.removeAt(index);
    pref.setStringList('carNum', carNumList);
  }

  checkText(title) {
    return Container(
      margin: EdgeInsets.only(top: 13.h),
      child: Row(children: [
        Container(
          width: 16.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xff167BB4),
              borderRadius: BorderRadius.circular(5.r)),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16.w,
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(left: 8.w),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  textAlign: TextAlign.start,
                  text: title,
                  size: 14.sp,
                  weight: FontWeight.w500,
                  overflow: TextOverflow.clip,
                )))
      ]),
    );
  }

  topText(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h),
            width: width,
            height: 24.h,
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/app_39/parking_title.png'),
          ),
          checkText('편리한 주차장 이용을 위해 차량번호를 입력하세요. '),
        ],
      ),
    );
  }

  inputText(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(() => Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 55.h),
              width: width,
              height: 40.h,
              alignment: Alignment.center,
              child: Container(
                width: 300.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color:
                            text_error.value ? Colors.red : Color(0xff0F9C50))),
                child: TextField(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600),
                  controller: car_controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '차량 번호 입력',
                    hintStyle: TextStyle(
                        color: Color(0xffA19898),
                        fontSize: 18.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (text) {
                    if (text.contains(
                        RegExp(r'''[a-zA-Z\s+!@#$%^&*(),.?'":{}|/<>]'''))) {
                      text_error.value = true;
                    } else {
                      text_error.value = false;
                    }
                    carNum.value = text;
                  },
                ),
              ),
            ),
            text_error.value
                ? Container(
                    width: width,
                    height: 10.h,
                    margin: EdgeInsets.only(left: 20.w, top: 5.h),
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: '한글 또는 숫자만 입력해주세요.',
                      color: Colors.red,
                      weight: FontWeight.w300,
                      size: 10.sp,
                    ),
                  )
                : Container(
                    height: 15.h,
                  ),
            Container(
              width: width,
              height: 19.h,
              margin: EdgeInsets.only(top: 16.h),
              child: CustomText(
                text: '띄어쓰기 없이 붙여서 입력해주세요.',
                weight: FontWeight.w700,
                size: 15.sp,
              ),
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30.h),
              child: GestureDetector(
                child: Container(
                  height: 30.h,
                  width: 180.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: text_error.value
                          ? Color(0xff999999)
                          : carNum.value == ''
                              ? Color(0xff999999)
                              : Color(0xff03A64A),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: CustomText(
                    text: '차량 등록하기',
                    size: 18.sp,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  if (!text_error.value) {
                    if (carNum.value.length < 6) {
                      showToast('5자 이상 입력해주세요.');
                    } else if (carNumList.length > 20) {
                      showToast('20자 이하로 입력해주세요.');
                    } else {
                      carNumListAdd();
                    }
                  }
                },
              ),
            )
          ]),
        ));
  }

  carRegistrationList(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48.h),
            width: width,
            height: 24.h,
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 20.h,
                  child: Image.asset('assets/app_39/car_icon.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 6.w),
                  child: CustomText(
                    text: '차량 등록 현황',
                    weight: FontWeight.w500,
                    size: 20.sp,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            height: 0.84.h,
            color: Colors.black,
            margin: EdgeInsets.only(top: 5.h),
          ),
          Obx(() => Container(
                margin: EdgeInsets.only(top: 36.h),
                width: width,
                height: 373.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(width: 0.84.w, color: Colors.black)),
                child: carNumList.isEmpty
                    ? CustomText(
                        text: '등록된 차량이 없습니다.',
                        weight: FontWeight.w700,
                        size: 18.sp,
                      )
                    : Container(
                        child: ListView.builder(
                            itemCount: carNumList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    width: width,
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(left: 15.w),
                                              alignment: Alignment.centerLeft,
                                              child: CustomText(
                                                // ignore: invalid_use_of_protected_member
                                                text: carNumList[index],
                                                weight: FontWeight.w700,
                                                size: 30.sp,
                                              ),
                                            )),
                                        GestureDetector(
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(right: 15.w),
                                            width: 60.w,
                                            height: 30.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color:
                                                  Colors.red.withOpacity(0.9),
                                            ),
                                            child: CustomText(
                                              // ignore: invalid_use_of_protected_member
                                              text: '삭제',
                                              weight: FontWeight.w600,
                                              size: 13.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: () {
                                            carNumListremove(index);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width,
                                    height: 0.84.h,
                                    margin: EdgeInsets.only(
                                        left: 15.w, right: 15.w),
                                    color: Color(0xff999999),
                                  )
                                ],
                              );
                            }),
                      ),
              ))
        ],
      ),
    );
  }

  bottomTitle(context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: 75.h),
      width: width,
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 18.h, bottom: 18.h),
      decoration: BoxDecoration(
          border: Border.all(width: 0.84.h, color: Colors.black),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      child: Column(
        children: [
          Container(
            width: width,
            height: 20.h,
            alignment: Alignment.centerLeft,
            child: Image.asset('assets/app_39/bottom_title.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 13.h),
            width: width,
            height: 2.h,
            color: Color(0xff167BB4),
          ),
          checkText('차량은 1인당 최대 3대까지 등록 가능합니다.'),
          checkText('편임시 차량번호, 외교 차량 등 일부 차량 등록 불가합니다.'),
          checkText('03년 이전 등록차량은 지역명까지 입력하시기 바랍니다.'),
          checkText('주차장 이용 관련 문의는 이용하시는 매장 고객센터를 통해 답변 받으실 수 있습니다.'),
          checkText('차량번호가 잘못 등록된 경우 비용정산과 주차권 사용이 제대로 되지 않으니 유의하시기 바랍니다.'),
          checkText('주차권 사용, 주차비 자동정산은 해당 주차 기기 설비가 설치된 매장에서만 이용하실 수 있습니다.'),
        ],
      ),
    );
  }
}
