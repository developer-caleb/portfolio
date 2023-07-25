import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_09/notification_screen.dart';
import 'package:hanaromart/scrn/app_18/point_list_screen.dart';
import 'package:hanaromart/tools/toast.dart';

import 'component/tab_icon.dart';
import 'home/home.dart';
import 'parking/parking.dart';
import 'pick/pick.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 2;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.index = _currentIndex;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      const msg = "'뒤로'버튼을 한 번 더 누르면 종료됩니다.";
      showToast(msg);
      return Future.value(false);
    }

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(), //scroll 방지
            controller: _tabController,
            children: [
              Pick(),
              PointListScreen(), //Point(),
              Home(),
              Parking(),
              NotificationScreen(),
            ],
          ),
          bottomNavigationBar: _bottomNavBar2(_tabController, _currentIndex, setState)),
    );
  }
}

Widget _bottomNavBar(TabController tabController, int currentIndex, setState) {
  return Container(
    height: 81,
    child: Column(
      children: [
        Divider(
          height: 1,
          color: Colors.black,
        ),
        Container(
          height: 80,
          color: Color(0xFFFAFBF7),
          width: double.infinity,
          child: TabBar(
            controller: tabController,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: [
              TabIcon("pickbutton"),
              TabIcon("pointbutton"),
              TabIcon(
                "homebutton",
                width: 120,
                height: 120,
              ),
              TabIcon("parkingbutton"),
              TabIcon("noticebutton", newicon: true),
            ],
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF6F6F6E), // underline color
                  width: 2.0, // underline thickness
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _bottomNavBar2(TabController tabController, int currentIndex, setState) {
  return SizedBox(
    height: 71,
    child: Column(
      children: [
        Divider(
          height: 1,
          color: Color(0xFF756E6E),
        ),
        Container(
          height: 70,
          color: Color(0xFFFAFBF7),
          width: double.infinity,
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            controller: tabController,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            tabs: const [
              BottomNavIcon(
                image: "ic_nav_pick",
                label: 'Pick 상품',
              ),
              BottomNavIcon(
                image: 'ic_nav_point',
                label: '포인트',
              ),
              BottomNavIcon(
                width: 55,
                height: 55,
                image: 'ic_nav_home',
              ),
              BottomNavIcon(
                image: 'ic_nav_parking',
                label: '주차',
              ),
              BottomNavIcon(image: 'ic_nav_noti', label: '공지', newIcon: true),
            ],
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF6F6F6E), // underline color
                  width: 2.0, // underline thickness
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
