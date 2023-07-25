import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_24/not_listed.dart';
import 'package:hanaromart/scrn/app_24/pre_draw.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class PrizeResultScreen extends StatelessWidget {
  const PrizeResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(titleString: '이벤트', body: true ? NotListed() : PreDraw()
        //body: Win(),
        );
  }
}
