import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/common/web_view_screen.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(
      urlAddress:
          'http://www.hanaromartapp.com/web/community/push.do?store_cd=1151&user_cd=Qtw4Fw2UhUCt%2FGDC19VXxQ%3D%3D',
      title: '메시지함',
      hamburgerButton: true,
    );
  }

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 70,
          leading: BackButton1(),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              color: Color(0xFF3B3B3A),
            ),
          ),
          title: Text('알림')),
      body: WebViewScreen(
          urlAddress:
              'http://www.hanaromartapp.com/web/community/push.do?store_cd=1151&user_cd=Qtw4Fw2UhUCt%2FGDC19VXxQ%3D%3D'),
    );
  }*/
}
