import 'package:flutter/material.dart';

import '../../app_27/deprecated_coupon_list.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: SingleChildScrollView(
        child: Column(
          // padding: EdgeInsets.zero,
          children: [
            MenuNavTop(context),
            PageLink('쿠폰', CouponList(), context),
            /*          PageLink('알림', Notifications(), context),
            PageLink('공지', Notice(), context),
            PageLink('리뷰', Review(), context),
            PageLink('문의', Inquiry(), context),
            PageLink('개인정보처리방침', PrivacyPolicyScreen(), context),
            PageLink('약관', Terms(), context),
            PageLink('내정보수정', ChangeMyInfo(), context),
            PageLink('비번찾기', FindPassword(), context),
            PageLink('비번수정', ChangePassword(), context),*/
          ],
        ),
      ),
    );
  }
}

Widget MenuNavTop(context) {
  return Container(
    child: Row(children: [Text('Menu'), CloseButton(context)]),
  );
}

Widget CloseButton(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Text('close'),
  );
}

Widget PageLink(title, page, context) {
  return Center(
    child: InkWell(
      child: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    ),
  );
}
