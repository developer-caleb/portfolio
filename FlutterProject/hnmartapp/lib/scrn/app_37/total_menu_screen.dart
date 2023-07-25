import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/scrn/app_03/component/barcode_button.dart';
import 'package:hanaromart/tools/grid_widget.dart';
import 'package:hanaromart/widgets/bar/market_bar.dart';
import 'package:hanaromart/widgets/bar/point_to_expire.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';
import 'package:hanaromart/widgets/buttons/barcode_button.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:hanaromart/widgets/image/logo_ci.dart';
import 'package:hanaromart/widgets/texts/nh_gradient_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../tools/logger.dart';

class TotalMenuScreen extends StatefulWidget {
  const TotalMenuScreen({Key? key}) : super(key: key);

  @override
  State<TotalMenuScreen> createState() => _TotalMenuScreenState();
}

class _TotalMenuScreenState extends State<TotalMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '',
      hamburgerButton: false,
      action: [
        IconButton(
          onPressed: () {
            ///홈으로 이동,
            Get.offAllNamed(Routes.HOME);
          },
          icon:
              //Image.asset('assets/app_37/ic_home.png')
              ImageIcon(
            AssetImage('assets/app_37/ic_home.png'),
            size: 25,
            color: Color(0xff3B3B3A),
          ),
        )
      ],
      body: ListView(
        padding: EdgeInsets.only(top: 30),
        children: [
          Row(
            children: [
              Padding(padding: const EdgeInsets.only(left: 15), child: LogoCI()),
              SizedBox(
                width: 2.5,
              ),
              NHGradientText(
                '앱서비스 한눈에 보기',
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          MarketBar(),
          _pointIndicatorCard(),
          //_buildProfileCard(),
          SizedBox(height: 20),
          _divider(iconName: 'ic_mypage', label: '마이페이지'),
          SizedBox(
            height: 11,
          ),
          GridWidget(items: <Widget>[
            menuWidget(
                label: '가입정보',
                img: Image.asset(
                  'assets/app_37/ic_id_info.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: '약관동의',
                img: Image.asset(
                  'assets/app_37/ic_agree_term.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: 'PW변경',
                img: Image.asset(
                  'assets/app_37/ic_change_pw.png',
                ),
                callback: () {
                  Get.toNamed(Routes.CHANGE_PASSWORD);
                }),
          ], columnNum: 3),
          SizedBox(
            height: 30,
          ),
          _divider(iconName: 'ic_shopping', label: '쇼핑컨텐츠'),
          GridWidget(items: <Widget>[
            menuWidget(
                label: '영수증',
                img: Image.asset(
                  'assets/app_37/ic_receipt.png',
                ),
                callback: () {
                  Get.toNamed(Routes.RECEIPT_LIST);
                }),
            menuWidget(
                label: '행사전단',
                img: Image.asset(
                  'assets/app_37/ic_refleat.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: '이벤트',
                img: Image.asset(
                  'assets/app_37/ic_event.png',
                ),
                callback: () {
                  Get.offNamed(Routes.EVENT);
                }),
            menuWidget(
                label: '할인쿠폰',
                img: Image.asset(
                  'assets/app_37/ic_coupon.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: '주차등록',
                img: Image.asset(
                  'assets/app_37/ic_parking.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: 'Pick 상품',
                img: Image.asset(
                  'assets/app_37/ic_pick.png',
                ),
                callback: () {
                  logger.d('111');
                }),
          ], columnNum: 3),
          SizedBox(
            height: 30,
          ),
          _divider(iconName: 'ic_global', label: '하나로마트 공식 SNS'),
          GridWidget(items: <Widget>[
            menuWidget(
                label: '유튜브',
                img: Image.asset(
                  'assets/app_37/ic_youtube.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: '페이스북',
                img: Image.asset(
                  'assets/app_37/ic_facebook.png',
                ),
                callback: () {
                  logger.d('111');
                }),
            menuWidget(
                label: '인스타',
                img: Image.asset(
                  'assets/app_37/ic_insta.png',
                ),
                callback: () {
                  logger.d('111');
                }),
          ], columnNum: 3),
          SizedBox(
            height: 53,
          ),

          _buttonBox(),
          /*        buildGreyButton(label: '이벤트 응모 내역 확인', iconAddress: 'assets/app_37/ic_event_confirm.png'),
          buildGreyButton(label: '자주 묻는 질문(FAQ)', iconAddress: 'assets/app_37/ic_faq.png'),
          buildGreyButton(
              label: '1:1 문의하기',
              iconAddress: 'assets/app_37/ic_talk.png',
              onTap: () {
                Get.toNamed(Routes.INQUIRY);
              }),*/
          SizedBox(
            height: 53,
          ),
          buildGreyButton(
              label: '매장 고객센터 연결',
              iconAddress: 'assets/app_37/ic_phone.png',
              onTap: () {},
              backgroundColor: Color(0xFF16B368)),
          SizedBox(
            height: 110,
          ),
          buildGreyButton(onTap: () {}, label: '하나로마트앱 로그아웃', iconAddress: 'assets/app_37/ic_share.png'),
          SizedBox(
            height: 52,
          ),
          infoCard()
        ],
      ),
    );
  }

  Container _buttonBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 1)),
      child: Column(
        children: [
          _buttonBoxElement(
            iconAddress: 'assets/app_37/ic_event_confirm.png',
            onTap: () {},
            label: '이벤트 응모 내역 확인',
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          _buttonBoxElement(
            iconAddress: 'assets/app_37/ic_faq.png',
            onTap: () {},
            label: '자주 묻는 질문(FAQ)',
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          _buttonBoxElement(
            iconAddress: 'assets/app_37/ic_talk.png',
            size: 23,
            onTap: () {
              Get.toNamed(Routes.INQUIRY);
            },
            label: '1:1 문의하기',
          )
        ],
      ),
    );
  }

  Widget _buttonBoxElement(
      {required VoidCallback onTap, required String label, required String iconAddress, double size = 30}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 54,
        child: Row(
          children: [
            SizedBox(
              width: 13,
            ),
            ImageIcon(
              AssetImage(iconAddress),
              color: Colors.black,
              size: size,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.27,
              ),
            ),
            Spacer(),
            ImageIcon(
              AssetImage('assets/app_37/ic_arrow_right.png'),
              color: Colors.black,
              size: 30,
            ),
            // Icon(
            //   Icons.keyboard_arrow_right,
            //   size: 40,
            // ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  BlueRoundedContainer _pointIndicatorCard() {
    return BlueRoundedContainer(
      subChild: PointToExpire(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/app_03/ic_point.png',
                  fit: BoxFit.fitHeight,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '포인트 잔액',
                  style: TextStyle(
                    color: Color(0xFF000807),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      logger.d('onClick barcode');
                      Get.toNamed(Routes.POINT_CARD);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: BarcodeButton(),
                    ))
              ],
            ),
          ),
          Row(
            children: [
              Spacer(),
              NHGradientText(
                '000,000 P',
                gradientDirection: GradientDirection.rtl,
                textStyle: TextStyle(
                  fontSize: 35,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.53,
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget infoCard() => Container(
        decoration: BoxDecoration(color: Color(0xFFEBECEF)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '농협경제지주 주식회사 소매체인본부',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.23,
              ),
            ),
            Text('대표이사 : 우성태 \n사업자등록번호 : 825-85-02030\n서울특별시 중구 새문안로 16(충정로 1가)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.8,
                  letterSpacing: -0.20,
                )),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 145,
                  child: ElevatedButton(
                    style: AppStyle.roundedElevatedButton2,
                    onPressed: () {
                      Get.toNamed(Routes.TERM);
                    },
                    child: Text('이용약관'),
                  ),
                ),
                SizedBox(
                  width: 145,
                  child: ElevatedButton(
                    style: AppStyle.roundedElevatedButton2,
                    onPressed: () {
                      Get.toNamed(Routes.PRIVACY_POLICY);
                    },
                    child: Text('개인정보 처리방침'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(alignment: Alignment.centerRight, child: Text('Version : 1.0.0'))
          ],
        ),
      );

  Container buildGreyButton(
      {required String label, required String iconAddress, VoidCallback? onTap, Color? backgroundColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.maxFinite,
      child: TextButton(
          style: AppStyle.greyTextButton
              .copyWith(backgroundColor: MaterialStateProperty.all<Color>(backgroundColor ?? AppColors.grey(0x93))),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(iconAddress),
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 5,
              ),
              Text(label),
            ],
          )),
    );
  }

  Widget _divider({
    required String iconName,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage('assets/app_37/$iconName.png'),
                size: 25,
                color: Color(0xFF21272A),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.black0B0A0A),
              ),
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Divider(
            color: AppColors.black0B0A0A,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 18, right: 18, top: 12, bottom: 30),
          margin: EdgeInsets.only(bottom: 62),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
            gradient: LinearGradient(colors: [
              Color(0xFF42A98A),
              Color(0xFF779930),
            ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '안녕하세요 고객님',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
              ),
              SizedBox(height: 6),
              Image.asset(
                'assets/app_37/ic_nh_ci_white.png',
                width: 140,
                height: 21,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Image.asset(
                    'assets/app_37/ic_map_white.png',
                    width: 13,
                    height: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '가좌농협 하나로마트',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.white),
                  ),
                  Spacer(),
                  OutlinedButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.SHOP_SEARCH,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
                          side: BorderSide(width: 1, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          elevation: 3,
                          backgroundColor: Color(0xff7BA34E),
                          foregroundColor: Colors.white),
                      child: Text('단골매장 변경'))
                ],
              )
            ],
          ),
        ),
        _pointBox()
      ],
    );
  }

  Container _pointBox() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      padding: EdgeInsets.only(left: 20, right: 13, top: 16, bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xff0B6F3F),
          width: 1.5,
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/app_03/ic_point.png',
                    width: 18,
                    height: 13,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'NH 포인트 잔액',
                    style: AppStyle.pointLabel2,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    '000,000 P',
                    style: AppStyle.pointText2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/app_03/ic_coupon.png',
                    width: 15,
                    height: 20,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '다운받은 쿠폰수',
                    style: AppStyle.pointLabel2,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    '000 개',
                    style: AppStyle.pointText2.copyWith(color: Color(0xFF0FB447)),
                  )
                ],
              )
            ],
          ),
          BarCodeButton()
        ],
      ),
    );
  }

  Widget menuWidget({required String label, required Widget img, required VoidCallback callback}) => InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: callback,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]),
              width: 60,
              height: 55,
              child: img,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.black0B0A0A),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
}
