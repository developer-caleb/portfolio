import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hanaromart/scrn/app_03/parking/parking_controller.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class Parking extends GetView<ParkingController> {
  const Parking({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Get.put(ParkingController());
    return DefaultScreen(
      titleString: '주차등록',
      backButton: false,
      body: Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              controller.topText(context),
              controller.inputText(context),
              controller.carRegistrationList(context),
               controller.bottomTitle(context),
            ],
          ),
        ),
      ),
    );
  }
}
