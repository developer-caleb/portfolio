import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/widgets/bar/text_tabbar.dart';
import 'package:hanaromart/widgets/default_screen.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({super.key});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> tagList = ['전체', '나의쿠폰', '상품쿠폰', '금액쿠폰'];

  @override
  void initState() {
    tabController = TabController(
      length: tagList.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        titleString: '쿠폰',
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextTabBar(
              tabString: tagList,
              onChanged: (index) {
                logger.d('index changed $index');
                tabController.animateTo(index);
              },
              newList: const [1],
            ),
            enrollCoupon(),
            CheckLabel(
              '하나로마트에서 발급한 13자리 쿠폰번호만 입력 가능합니다.',
              textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: TabBarView(physics: NeverScrollableScrollPhysics(), controller: tabController, children: [
                GridView(
                  padding: EdgeInsets.only(left: 12, right: 12, top: 30),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 53 / 100, crossAxisSpacing: 28, mainAxisSpacing: 34),
                  children: List.generate(6, (index) => couponCard()),
                ),
                Center(child: Text('나의쿠폰')),
                Center(child: Text('상품쿠폰')),
                Center(child: Text('금액쿠폰')),
              ]),
            ),
          ],
        ));
  }

  Column couponCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Placeholder()),
        SizedBox(
          height: 8,
        ),
        Text(
          '브랜드 삽겹살  할인쿠폰',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.21,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '000,000원 할인',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            letterSpacing: -0.21,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '2023.01. 01 ~ 2023.01. 10',
          style: TextStyle(
            color: Color(0xFF3C3C3B),
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.18,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        SizedBox(
          width: double.maxFinite,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF3A9158),
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.20,
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.ONETIME_COUPON);
                //Get.to(() => InfiniteCouponUseScreen());
              },
              child: Text('쿠폰 다운로드')),
        )
      ],
    );
  }

  Padding enrollCoupon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Text(
            '쿠폰등록',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              letterSpacing: -0.24,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: TextField(
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ))),
            ),
          )),
          TextButton(
              style: TextButton.styleFrom(
                  // minimumSize: Size(40, 25),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  backgroundColor: Color(0xFF245E57),
                  foregroundColor: Colors.white),
              onPressed: () {},
              child: Text(
                '등록',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.20,
                ),
              ))
        ],
      ),
    );
  }
}
