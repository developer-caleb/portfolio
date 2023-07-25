import 'package:get/get.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/user_network_repository.dart';
import 'package:matjipmemo/pages/matjip/tag_matjip_page.dart';
import 'package:matjipmemo/route/router_name.dart';
import 'package:matjipmemo/tools/logger.dart';
import 'package:matjipmemo/tools/show_toast.dart';

void clickHashTag(String str) {
  logger.d('hashtag click $str');
  Get.to(() => TagMatjipPage(tagString: str));
}

void clickMenstionTag(String str) async {
  logger.d('MenstionTag click $str');
  String? uid = await userNetworkRepository.findUserWithNickname(str);
  logger.d(uid ?? '없음');
  if (uid != null) {
    if (Get.find<LoginController>().userModel?.uid == uid) {
      return;
    }
    Get.toNamed(
      Routes.OthersProfile,
      arguments: uid,
    );
  } else {
    showToast('회원을 찾을 수 없습니다.');
  }
}

String correctTagText(String origin) {
  return origin.replaceAll(' #', '#').replaceAll('#', ' #');
}

String taglistToString(List<dynamic> tags) {
  String tagstring = '';
  for (var element in tags) {
    tagstring = tagstring + '#$element ';
  }
  return tagstring;
}
