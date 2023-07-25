import 'package:get/get.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/list_network_repository.dart';
import 'package:matjipmemo/models/firebase/list_model.dart';
import 'package:matjipmemo/models/firebase/user_model.dart';
import 'package:matjipmemo/pages/post/post_mode_manager.dart';
import 'package:matjipmemo/route/router_name.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/view/widget/matjip_item/matjiplist_widget.dart';

class ListController extends GetxController {
  final RxList<ListModel> _listModelList = <ListModel>[].obs;

  RxList<ListModel> get listModelListObx => _listModelList;

  List<ListModel> get listModelList => _listModelList;

  UserModel? get userModel => Get.find<LoginController>().userModel;

  @override
  void onInit() {
    super.onInit();
  }

  void clean() {
    _listModelList.value = [];
  }

  Future getListList() async {
    logger.d('getListList');
    PostModeManager postModeManager = PostModeManager();
    if (userModel == null) {
      return logger.e('로그인 유저X, ');
    }
    _listModelList.value = await listNetworkRepository.getUsersListList(userModel: userModel!, postMode: postModeManager.postMode);
    logger.d('getListList $listModelList');
  }

  void onClickList(int index) async {
    logger.d('onClickList ${listModelList[index].listName}');
    ListModel? newListModel = await Get.toNamed(Routes.DetailList, arguments: listModelList[index]) as ListModel?;
    if (newListModel != null) {
      _listModelList[index] = newListModel;
    }
  }

  void onLongClickList(ListModel list) async {
    logger.d('onLongClickList ${list.listName}');
    if (Get.find<LoginController>().userModel == null) {
      return Get.find<LoginController>().doLogin();
    }
    logger.d("on long press ${list.listId}");
    await optionButtonListBottomSheet(list);
    getListList();
    /*  await Get.toNamed(Routes.DetailList,
        arguments: list
    );*/
  }
}
