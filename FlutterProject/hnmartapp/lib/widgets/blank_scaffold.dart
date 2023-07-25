import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlankScaffold extends StatelessWidget {
  const BlankScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '작업 예정입니다!😢\n\n${Get.parameters['text']}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
