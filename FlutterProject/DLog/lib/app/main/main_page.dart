import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:locationdiary/app/main/main_controller.dart';
import 'package:locationdiary/app/diary/diary_page.dart';
import 'package:locationdiary/app/settings/setting_page.dart';
import 'package:locationdiary/utils/app_colors.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              DiaryPage(),
              SizedBox(),
              SettingPage(),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: SizedBox(
              height: 56,
              child: BottomNavigationBar(
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.lightGray01,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      controller.tabIndex == 0
                          ? 'assets/icons/icon_list_selected.png'
                          : 'assets/icons/icon_list.png',
                      width: 24,
                    ),
                    label: 'Feed',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.systemBlack,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(7.0, 8.0, 9.0, 8.0),
                        child: Image.asset(
                          'assets/icons/pencil_line.png',
                        ),
                      ),
                    ),
                    label: 'Post',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      controller.tabIndex == 2
                          ? 'assets/icons/icon_mypage_selected.png'
                          : 'assets/icons/icon_mypage.png',
                      width: 24,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
