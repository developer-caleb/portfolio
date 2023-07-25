import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/common/web_view_screen.dart';

class MyInfoEditScreen extends StatelessWidget {
  const MyInfoEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(
      urlAddress: 'http://www.hanaromartapp.com/web/access/nhahm.do?regiDesc=02&amnNo=9999880000831351',
      title: '내정보확인',
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
          title: Text('내정보확인')),
      body: WebViewScreen(
          urlAddress: 'http://www.hanaromartapp.com/web/access/nhahm.do?regiDesc=02&amnNo=9999880000831351'),
    );
  }*/
}
