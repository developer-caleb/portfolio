import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/config/constants/image_constant.dart';

import '../../common/custom_image_view.dart';
import '../../common/size_utils.dart';

// ignore: must_be_immutable

class ListLayerOneItemWidget extends StatelessWidget {
  const ListLayerOneItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: ItemCamera(),
        ),
        SizedBox(
          height: getVerticalSize(
            38,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: ItemLocation(),
        ),
        SizedBox(
          height: getVerticalSize(
            38,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: ItemPhone(),
        ),
        SizedBox(
          height: getVerticalSize(
            38,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: ItemNotification(),
        ),
      ],
    );
  }
}

List<Widget> ItemCamera() {
  return [
    CustomImageView(
      svgPath: ImageConstant.camera_icon,
      height: getVerticalSize(
        62,
      ),
      width: getHorizontalSize(
        58,
      ),
    ),
    Padding(
      padding: getPadding(
        left: 6,
        top: 11,
        bottom: 9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '카메라',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterSemiBold16,
          ),
          Padding(
            padding: getPadding(
              top: 6,
            ),
            child: Text(
              '이벤트 참여에 필요한 QR코드 인식을 위해 사용합니다.',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterSemiBold12,
            ),
          ),
        ],
      ),
    ),
  ];
}

List<Widget> ItemLocation() {
  return [
    CustomImageView(
      svgPath: ImageConstant.location_icon,
      height: getVerticalSize(
        62,
      ),
      width: getHorizontalSize(
        58,
      ),
    ),
    Padding(
      padding: getPadding(
        left: 6,
        top: 11,
        bottom: 9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '위치정보',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterSemiBold16,
          ),
          Padding(
            padding: getPadding(
              top: 6,
            ),
            child: Text(
              '고객님과 가까운 마트를 찾을 수 있도록 도와줍니다.',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterSemiBold12,
            ),
          ),
        ],
      ),
    ),
  ];
}

List<Widget> ItemPhone() {
  return [
    CustomImageView(
      svgPath: ImageConstant.phone_icon,
      height: getVerticalSize(
        62,
      ),
      width: getHorizontalSize(
        58,
      ),
    ),
    Padding(
      padding: getPadding(
        left: 6,
        top: 11,
        bottom: 9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '전화',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterSemiBold16,
          ),
          Padding(
            padding: getPadding(
              top: 6,
            ),
            child: Text(
              '고객님 방문 매장 고객센터 전화 연결 시 이용합니다.',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterSemiBold12,
            ),
          ),
        ],
      ),
    ),
  ];
}

List<Widget> ItemNotification() {
  return [
    CustomImageView(
      svgPath: ImageConstant.notification_icon,
      height: getVerticalSize(
        62,
      ),
      width: getHorizontalSize(
        58,
      ),
    ),
    Padding(
      padding: getPadding(
        left: 6,
        top: 11,
        bottom: 9,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '알림',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterSemiBold16,
          ),
          Padding(
            padding: getPadding(
              top: 6,
            ),
            child: Text(
              '행사 등 쇼핑 혜택 정보를 알려드리기 위해 필요합니다.',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterSemiBold12,
            ),
          ),
        ],
      ),
    ),
  ];
}
