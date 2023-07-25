import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';

class CustomWidget {
  AppBar customAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 150,
      leading: SizedBox(
        width: 150,
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                '이전',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Image.asset('assets/app_06/menubutton.png'),
        )
      ],
    );
  }

  Widget OpenIndicator(bool isOpening) {
    return Container(
        decoration: BoxDecoration(
            color: isOpening == true ? AppColors.primary : Colors.grey[400],
            borderRadius: BorderRadius.all(Radius.circular(18))),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Text(
            isOpening == true ? '앱 운영중' : '운영 준비중',
            style: TextStyle(color: isOpening == true ? Colors.white : Colors.black, fontWeight: FontWeight.w700),
          ),
        ));
  }

  Widget withIconText(int index, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
        ),
        index == 0
            ? SvgPicture.asset(
                'assets/app_06/img_location.svg',
                width: 16,
              )
            : CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey,
                child: Image.asset(
                  'assets/app_06/phone.png',
                  width: 16,
                )),
        SizedBox(
          width: 8,
        ),
        Text(text, style: TextStyle(fontFamily: 'Pretendard', fontSize: 15, fontWeight: FontWeight.w700))
      ],
    );
  }
}
