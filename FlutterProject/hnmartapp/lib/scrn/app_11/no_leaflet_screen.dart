import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanaromart/config/app_style.dart';

class NoLeafletScreen extends StatefulWidget {
  const NoLeafletScreen({Key? key}) : super(key: key);

  @override
  State<NoLeafletScreen> createState() => _NoLeafletScreenState();
}

class _NoLeafletScreenState extends State<NoLeafletScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 170,
        ),
        Center(
          child: SizedBox(
            width: 120,
            height: 135,
            child: SvgPicture.asset(
              'assets/app_11/bigleaflet.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          '등록된 행사전단이 없습니다.',
          style: AppStyle.noContents,
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(onPressed: () {}, style: AppStyle.noContentsTextButton, child: Text('다른 점포 전단 보기')),
        Spacer(
          flex: 265,
        ),
      ],
    );
  }
}
