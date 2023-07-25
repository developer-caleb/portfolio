import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanaromart/widgets/texts/nh_gradient_text.dart';

class Win extends StatelessWidget {
  Win({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 54),
            child: SvgPicture.asset(
              'assets/app_24/ic_fireworks.svg',
              width: 169,
              height: 167,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/app_24/ic_star.png',
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '축하합니다!',
                  style: TextStyle(
                    color: Color(0xFF2A66AC),
                    fontSize: 25,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.38,
                  ),
                ),
              ),
              Image.asset(
                'assets/app_24/ic_star.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 10),
            child: Text(
              '이벤트 추첨결과',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.27,
              ),
            ),
          ),
          NHGradientText(
            '0등',
            textStyle: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '경품 수령을 위한 진행 사항은\n공지사항을 확인해주시기 바랍니다.',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: 'Pretendard', fontWeight: FontWeight.w500, height: 1.5),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1),
                    elevation: 10,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.38,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black),
                onPressed: () {},
                child: Text('공지사항 보기')),
          ),
          Spacer(
            flex: 100,
          ),
        ],
      ),
    );
  }
}
