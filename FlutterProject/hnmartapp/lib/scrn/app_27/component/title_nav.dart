import 'package:flutter/material.dart';

import '../../app_03/component/menu.dart';
import '../../app_03/guest_home_screen.dart';

Widget TitleNav(title, context) {
  return Row(
    children: [
      SizedBox(
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('뒤로가기'),
        ),
      ),
      SizedBox(
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const GuestHomeScreen()));
          },
          child: Text(title),
        ),
      ),
      SizedBox(
        width: 100,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));
          },
          child: const Text('전체메뉴'),
        ),
      ),
    ],
  );
}
