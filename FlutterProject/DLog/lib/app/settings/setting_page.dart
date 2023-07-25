import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:locationdiary/app/auth/auth_controller.dart';
import 'package:locationdiary/app/profile/profile_controller.dart';
import 'package:locationdiary/route/router_name.dart';
import 'package:locationdiary/utils/app_colors.dart';
import 'package:locationdiary/utils/app_text_styles.dart';
import 'package:locationdiary/utils/logger.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  static const double profileSize = 44;

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put<ProfileController>(ProfileController());
    return GetBuilder<AuthController>(
      builder: (loginController) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 76,
                child: Center(
                  child: Row(
                    children: [
                      //프로필 사진
                      SizedBox(
                        width: profileSize,
                        height: profileSize,
                        child: ClipOval(
                          child: (loginController.userModel
                              ?.userProfileImgUrl?.isNotEmpty ??
                              false)
                              ? FutureBuilder<File>(
                            future: profileController.getImage(
                              fileName: loginController
                                  .userModel!.userProfileImgUrl!,
                              directory: 'profile',
                            ),
                            builder: (BuildContext context,
                                AsyncSnapshot<File> snapshot) {
                              if (snapshot.hasData) {
                                logger.i('스냅샷: ${snapshot.data}');
                                return snapshot.data == null
                                    ? const Text('null')
                                    : Image.file(
                                  snapshot.data!,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                );
                              } else if (snapshot.hasError) {
                                logger.i('에러');
                                return const SizedBox();
                              } else {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Center(
                                      child:
                                      CircularProgressIndicator(
                                        color: AppColors.systemBlack60,
                                      )),
                                );
                              }
                            },
                          )
                              : Image.asset(
                            'assets/icons/profile_default.png',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        loginController.userModel?.userNickname ?? "",
                        style: AppTextStyles.body1,
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () => Get.toNamed(Routes.editProfilePage),
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 14),
                              decoration: BoxDecoration(
                                  color: AppColors.lightGray02,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                '수정',
                                style: AppTextStyles.button2.copyWith(
                                  color: AppColors.gray01,
                                ),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
