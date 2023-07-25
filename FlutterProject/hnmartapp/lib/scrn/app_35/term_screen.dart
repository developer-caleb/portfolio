import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/common/web_view_screen.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebViewScreen(
      urlAddress: 'http://www.hanaromartapp.com/web/about/terms.do',
      title: '이용약관',
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
          title: Text('이용약관')),
      body: WebViewScreen(urlAddress: 'http://www.hanaromartapp.com/web/about/terms.do'),
    );
  }*/
}
