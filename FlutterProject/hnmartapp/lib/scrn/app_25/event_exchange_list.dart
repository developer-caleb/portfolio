import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/widgets/blue_rounded_container.dart';
import 'package:hanaromart/widgets/bottom_container.dart';
import 'package:hanaromart/widgets/buttons/coupon_check_button.dart';

class EventExchangeList extends StatelessWidget {
  const EventExchangeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 40),
      children: [
        ...[0, 1]
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 57),
                  child: BlueRoundedContainer(
                    subText: '교환일자 23.01.31',
                    child: Column(
                      children: [
                        SizedBox(
                          height: 23,
                        ),
                        Text(
                          '스탬프 팡팡 이벤트 1천원 할인쿠폰',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.30,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '총 적립 스탬프 10개',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 20),
                          child: CouponCheckButton(
                            onTap: () {
                              Get.toNamed(Routes.COUPON_LIST); //TODO CouponList App27 연결
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
        //bottom container
        BottomContainer(
          title: '이벤트 상품 교환 안내',
          item: ['해당 이벤트 종료 후 상품 교환 내역 자동 삭제됩니다.', '교환 완료 후 이벤트 상품 재수령은 불가능합니다.', '상품이 앱 쿠폰인 경우 [나의쿠폰]에서 확인 가능합니다.'],
        )
      ],
    );
    //쿠폰이 있는 거랑 없는 거랑 어떤 차이가 있는지 확인 필요
  }
}
