import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/common/web_view_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(
      urlAddress:
          //  'http://dv-www.hanaromartapp.com:20080/api/receipt/img?na_bzplc=8808983120119&sl_dt=20230222&pos_no=1012&pos_rctw_no=00433',
          'http://www.hanaromartapp.com/web/community/notice.do?store_cd=1151&user_cd=Qtw4Fw2UhUCt%2FGDC19VXxQ%3D%3D&type=H',
      title: '공지사항',
      backButton: false,
      hamburgerButton: true,
    );
  }

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 70,
          // leading: BackButton1(),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              color: Color(0xFF3B3B3A),
            ),
          ),
          title: Text('공지사항')),
      body: WebViewScreen(
          urlAddress:
              'http://www.hanaromartapp.com/web/community/notice.do?store_cd=1151&user_cd=Qtw4Fw2UhUCt%2FGDC19VXxQ%3D%3D&type=H'),
    );
  }*/
}
