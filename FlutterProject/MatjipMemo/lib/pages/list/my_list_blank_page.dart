import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListBlankPage extends StatelessWidget {
  const MyListBlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Center(
              child: Text(
            "😭",
            style: TextStyle(fontSize: 40),
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "리스트가 비어있어요".tr,
            style: const TextStyle(
              fontSize: 20,
            ),
          )),
          const Spacer(),
        ],
      ),
    );
  }
}
