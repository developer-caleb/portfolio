import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matjipmemo/constants/common_size.dart';
import 'package:matjipmemo/constants/const_duration.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/pages/list/list_controller.dart';
import 'package:matjipmemo/pages/list/my_list.dart';
import 'package:matjipmemo/pages/manage_matjip/manage_or_loading_page.dart';
import 'package:matjipmemo/pages/my/my_page.dart';
import 'package:matjipmemo/pages/post/post_mode_manager.dart';
import 'package:matjipmemo/pages/square/square_controller.dart';
import 'package:matjipmemo/pages/square/square_or_loading_page.dart';
import 'package:matjipmemo/service/internal_data_service.dart';
import 'package:matjipmemo/service/remote_config_service.dart';
import 'package:matjipmemo/tools/show_toast.dart';
import 'package:matjipmemo/view/widget/tutorials/mains/main_tutorial.dart';
import 'package:matjipmemo/view/widget/tutorials/tutorial.dart';
import 'package:matjipmemo/view/widget/tutorials/tutorial_keys.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'constants/app_colors.dart';
import 'pages/manage_matjip/manage_controller.dart';
import 'route/router_name.dart';
import 'tools/enums.dart';
import 'tools/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey myMatjipKey = GlobalKey();
  GlobalKey squareKey = GlobalKey();
  GlobalKey infoKey = GlobalKey();
  int _pageIndex = 0;
  final List<Widget> _screens = <Widget>[
    const SquareOrLoadingPage(),
    const MyListPage(),
    const ManageOrLoadingPage(),

    ///ShoppingScreen(),
    const MyPage()
  ];
  List<TargetFocus> targets = [];
  List<BottomNavigationBarItem> btmNavItems = [];
  List<ImageProvider> btmNavIconList = [
    const AssetImage("assets/icons/ic_library.png"),
    const AssetImage("assets/icons/ic_plus_circle.png"),
    const AssetImage("assets/icons/ic_locationmarker.png"),
    const AssetImage("assets/icons/ic_user.png"),
  ];
  List<Key?> btmNavKeyList = []; //key For tutorial
  List<String> btmNavLabelList = ['광장'.tr, '추가'.tr, '내 장소'.tr, '내 정보'.tr];
  bool isContainList = (Get.locale?.languageCode ?? "ko") == "ko";

  @override
  void initState() {
    PostModeManager postModeManager = PostModeManager();
    switch (postModeManager.postMode) {
      case PostMode.eat:
        btmNavLabelList[2] = '내 맛집'.tr;
        break;
      case PostMode.trip:
        btmNavLabelList[2] = '내 여행'.tr;
        break;
      case PostMode.eatrip:
      default:
        btmNavLabelList[2] = '내 장소'.tr;
        break;
    }
    btmNavKeyList = [squareKey, null, myMatjipKey, infoKey];
    if (isContainList) {
      _screens.insert(
        3,
        const MyListPage(),
      );
      btmNavIconList.insert(
        3,
        const AssetImage("assets/icons/ic_folder.png"),
      );
      btmNavLabelList.insert(
        3,
        '리스트'.tr,
      );
      btmNavKeyList.insert(3, null);
    }
    btmNavItems = List.generate(
        btmNavLabelList.length,
        (index) => BottomNavigationBarItem(
            icon: ImageIcon(
              btmNavIconList[index],
              key: btmNavKeyList[index],
              size: bottomNavigationBarItemSize,
            ),
            label: btmNavLabelList[index]));
    targets = [squareTutorial(squareKey), myMatjipTutorial(myMatjipKey), myTutorial(infoKey)];
    super.initState();

    Future.delayed(const Duration(milliseconds: 250)).then((value) async {
      if (Get.find<LoginController>().authStatus == AuthStatus.PROCESSING) {
        return logger.d('로그인 진행 중-> 공지사항 보내지 않음');
      }
      Tutorial tutorial = Tutorial();
      tutorial.show(context, targets, KEY_TUTORIAL_MAIN);
      Get.find<RemoteConfigService>().showRemoteConfigDialogs();
    });
    logger.d("initiated : main page");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Stack(
        children: [
          Scaffold(
              /*   floatingActionButton: Visibility(
                visible: false,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (controller.authStatus == AuthStatus.SIGNOUT) {
                      return Get.find<LoginController>().doLogin();
                    } else {
                      if (Get.find<InternalDataService>().matjipLength >= 3000) {
                        return showToast('여행지는 최대 3000개까지 만드실 수 있습니다.');
                      } else {
                        return onClickWrite();
                      }
                    }
                  },
                  backgroundColor: AppColors.mainColor,
                  label: const Text(
                    '추가',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),*/
              body: AnimatedSwitcher(duration: AppDurations.tabSwitchDuration, child: _screens[_pageIndex]),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                items: btmNavItems,
                unselectedItemColor: Colors.black54,
                selectedItemColor: AppColors.mainColor,
                onTap: (index) async {
                  if (index == 1) {
                    if (controller.authStatus == AuthStatus.SIGNOUT) {
                      return Get.find<LoginController>().doLogin();
                    } else {
                      if (Get.find<InternalDataService>().matjipLength >= 3000) {
                        return showToast('여행지는 최대 3000개까지 만드실 수 있습니다.');
                      } else {
                        if (isContainList) {
                          return onClickWrite();
                        } else {
                          return Get.toNamed(Routes.WriteSpot);
                        }
                      }
                    }
                  }
                  if (index != _pageIndex) {
                    setState(() {
                      _pageIndex = index;
                    });
                  } else {
                    if (btmNavKeyList[index] == squareKey) {
                      logger.d('광장 두 번 클릭');
                      Get.find<SquareController>().onScrollToTop();
                      return;
                    }
                    if (btmNavKeyList[index] == myMatjipKey) {
                      logger.d('내 맛집 두 번 클릭');
                      Get.find<ManagerController>().onScrollToTop();
                      return;
                    }
                  }
                },
                currentIndex: _pageIndex,
              )),
          Obx(
            () => Visibility(
              visible: controller.authStatus == AuthStatus.PROCESSING,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black87.withOpacity(0.4),
              ),
            ),
          )
        ],
      );
    });
  }

  void onClickWrite() async {
    await Get.dialog(Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildDialogButton(
            text: '✈️ 맛집, 여행',
            onTap: () {
              logger.d('select ✈️ 맛집, 여행');
              Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
              Get.toNamed(Routes.WriteSpot);
            },
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          buildDialogButton(
            text: '📝 리스트',
            onTap: () async {
              if (Get.find<ListController>().listModelList.length >= 10) {
                return showToast('리스트를 10개 이상 추가할 수 없습니다');
              }
              logger.d('select 📝 리스트');
              Get.until((route) => route is! PopupRoute); //팝업창 모두 끄기
              ListModel? newListModel = await Get.toNamed(Routes.WriteList) as ListModel?;
              if (newListModel != null) {
                Get.find<ListController>().getListList();
              }
            },
          ),
        ],
      ),
    ));
    //Get.toNamed(Routes.WriteSpot);
  }

  Widget buildDialogButton({required String text, required VoidCallback onTap}) => InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.maxFinite,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                text,
                style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      );
}
