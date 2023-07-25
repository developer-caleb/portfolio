import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';

import '../app06_controller.dart';

class Region extends StatelessWidget {
  const Region({super.key, required this.controller});
  final App06Controller controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            '지역 선택',
            style: TextStyle(
                fontSize: 16, color: AppColors.primary, fontWeight: FontWeight.w600, fontFamily: 'Pretendard'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: wrapRegions(context),
        )
      ],
    );
  }

  Widget wrapRegions(context) {
    return Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Obx(() => Wrap(
            spacing: 8,
            children: controller.addressModels.map((element) {
              return Obx(
                () => ChoiceChip(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(
                      color: Colors.black,
                      width: .8,
                    ),
                  ),
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: controller.regionName.value == element.lname ? Colors.white : Colors.black,
                  ),
                  label: Text(
                    element.lname,
                    textAlign: TextAlign.center,
                  ),
                  selected: controller.regionName.value == element.lname,
                  onSelected: (bool? selected) {
                    selected == true ? controller.onChange(element.lname) : null;
                  },
                ),
              );
            }).toList()))
        // Obx(()=>  GridView.builder(
        //     shrinkWrap: true,
        //     physics: const NeverScrollableScrollPhysics(),
        //     // padding: EdgeInsets.zero,
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 4,

        //   mainAxisSpacing: 12,crossAxisSpacing: 12,  childAspectRatio: 1.9,
        //   ),
        //   itemCount: controller.addressModels.length,
        //    itemBuilder: (BuildContext context, int index) => Obx(()=>
        //    Container(
        //     width: 500,
        //      child: ChoiceChip(
        //         backgroundColor:Colors.transparent,
        //          shape: RoundedRectangleBorder(
        //        borderRadius: BorderRadius.circular(18),
        //        side:const BorderSide(
        //          color: Colors.black,
        //          width: 1,
        //        ),
        //      ),
        //      selectedColor: AppColors.primary,

        //         labelStyle: TextStyle(
        //        color: controller.regionIndex.value == index ? Colors.white : Colors.black,
        //      ),
        //         label: Text(controller.addressModels[index].lname,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),

        //         selected: controller.regionIndex.value ==index,
        //         onSelected: (bool? selected){
        //          selected==true? controller.onChange(index) : null;
        //         },
        //         ),
        //    ),

        //      )

        // ))
        );
  }
}
