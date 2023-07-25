import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/common/size_utils.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      padding: getPadding(
        top: 52,
        bottom: 52,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 28, bottom: 34),
              margin: EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              decoration: BoxDecoration(
                color: Color(0xffFCFAFA),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Image.asset(
                    'assets/app_01/ic_warning.png',
                    width: 23,
                    height: 23,
                  )),
                  Text(
                    '서버 통신 장애로\n앱 실행이 원활하지 못 합니다.\n잠시 후 재접속하시기 바랍니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Spacer()
                ],
              )),
          Spacer(),
          Image.asset(
            'assets/app_01/logo_ci.png',
            width: 270,
            height: 34,
          )
        ],
      ),
    ));
  }
}
