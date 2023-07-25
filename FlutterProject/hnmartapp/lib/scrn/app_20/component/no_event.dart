import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanaromart/config/app_style.dart';

class NoEvent extends StatelessWidget {
  const NoEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(
            flex: 240,
          ),
          SvgPicture.asset(
            'assets/app_20/ic_event.svg',
            fit: BoxFit.scaleDown,
            width: 120,
            height: 135,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            '등록된 이벤트가 없습니다',
            style: AppStyle.noContents,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: AppStyle.noContentsTextButton
                  .copyWith(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffE06C81))),
              onPressed: () {},
              child: Text('다른 점포 이벤트 보기')),
          Spacer(
            flex: 336,
          ),
        ],
      ),
    );
  }
}
