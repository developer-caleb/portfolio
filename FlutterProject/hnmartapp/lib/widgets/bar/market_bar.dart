import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_style.dart';

class MarketBar extends StatelessWidget {
  const MarketBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 12,
        ),
        Image.asset(
          'assets/app_03/ic_store_chage.png',
          width: 24,
          height: 24,
        ),
        SizedBox(width: 7),
        Text(
          '가좌농협 하나로마트',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 10),
            child: ElevatedButton(style: AppStyle.roundedElevatedButton, onPressed: () {}, child: Text('단골매장변경'))),
      ],
    );
  }
}
