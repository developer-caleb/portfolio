import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';
import '../component/menu.dart';
import '../component/tab_icon.dart';

class HomeNavTop extends StatelessWidget {
  double iconsize = 40;
  double smalliconsize = 30;

  HomeNavTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TabIcon('storechangebutton', width: iconsize, height: iconsize),
                  SizedBox(width: 10),
                  CustomText(text: '단골매장설정', size: 18, weight: FontWeight.bold),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabIcon('newicon'),
                  TabIcon('messagebutton', width: iconsize, height: iconsize, newicon: true),
                  SizedBox(width: 20),
                  InkWell(
                    child: TabIcon('menubutton', width: smalliconsize, height: smalliconsize),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Menu(),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
