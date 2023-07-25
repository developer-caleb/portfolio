import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/scrn/app_02/component/custom_button.dart';
import 'package:hanaromart/scrn/app_02/component/list_layer_one_item.dart';
import 'package:hanaromart/tools/preferences.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../routes/router_name.dart';
import '../common/size_utils.dart';

class PermissionGuideScreen extends StatelessWidget {
  const PermissionGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteA700,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 19,
            bottom: 19,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  top: 3,
                ),
                child: Text(
                  '앱 권한 설정',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold20,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 21,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: AppColors.gray800,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 16,
                ),
                child: Text(
                  '하나로마트앱 서비스 이용을 위해 접근 권한 허용이 필요합니다.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold12.copyWith(fontSize: 13),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 10,
                  top: 39,
                  right: 18,
                ),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      height: getVerticalSize(
                        38,
                      ),
                    );
                  },
                  itemCount: 1,
                  //카메라, 위치정보, 전화, 알림
                  itemBuilder: (context, index) {
                    return ListLayerOneItemWidget();
                  },
                ),
              ),
              Container(
                width: getHorizontalSize(
                  272,
                ),
                margin: getMargin(
                  left: 48,
                  top: 36,
                  right: 38,
                ),
                child: Text(
                  '선택적 접근 권한을 허용하지 않으실 경우 이벤트 참여 등\n일부 앱(App) 기능 사용에 제한이 있을 수 있습니다.',
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtInterSemiBold12Black90001.copyWith(fontSize: 12),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 26,
                ),
                child: Divider(
                  height: getVerticalSize(
                    1,
                  ),
                  thickness: getVerticalSize(
                    1,
                  ),
                  color: AppColors.gray800,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 18,
                    top: 12,
                  ),
                  child: Text(
                    '접근 권한 변경 방법',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold16.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 18,
                    top: 7,
                  ),
                  child: Text(
                    '휴대폰 설정 ▶ 하나로마트앱 ▶ 해당 권한 설정 변경 ',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold12.copyWith(fontSize: 12),
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                  height: getVerticalSize(
                    35,
                  ),
                  width: getHorizontalSize(
                    200,
                  ),
                  text: '내용 확인했습니다.',
                  margin: getMargin(
                    left: 80,
                    right: 80,
                  ),
                  onTap: () {
                    on_button_tap(context);
                  }),
              Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void on_button_tap(BuildContext ctx) async {
  await Permission.camera.request();
  await Permission.mediaLibrary.request();
  await Permission.location.request();
  await Permission.phone.request();
  await Permission.notification.request();

  // 접근 권한 설정 (App-02) 완료 상태 저장
  await setCompletePermissionSetup(true);

  // PermissionGuideScreen 위젯이 표시된다는 것은 앱이 설치된 후 처음에만 나오는 상황이므로 로그인하지 않았어야 한다
  final isLoggedIn = await getUserLoggedInState();
  assert(isLoggedIn == false);

  Get.offNamed(Routes.GUEST_HOME);
}
