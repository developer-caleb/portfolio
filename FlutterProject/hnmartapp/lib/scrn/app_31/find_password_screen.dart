import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/common/web_view_screen.dart';

class FindPasswordScreen extends StatelessWidget {
  const FindPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(
      urlAddress: 'http://www.hanaromartapp.com/web/access/nhahm.do?regiDesc=03&amnNo',
      title: '비밀번호찾기',
      canGoBack: false,
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
          title: Text('비밀번호찾기')),
      body: WebViewScreen(urlAddress: 'http://www.hanaromartapp.com/web/access/nhahm.do?regiDesc=03&amnNo'),
    );
  }*/
}
