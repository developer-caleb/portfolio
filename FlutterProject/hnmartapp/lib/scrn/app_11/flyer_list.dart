import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/widgets/bar/market_bar.dart';
import 'package:hanaromart/widgets/bar/text_tabbar.dart';

class FlyerList extends StatefulWidget {
  const FlyerList({Key? key}) : super(key: key);

  @override
  State<FlyerList> createState() => _FlyerListState();
}

class _FlyerListState extends State<FlyerList> {
  List<String> tabString = [
    '전체상품',
    '신선식품',
    '가공식품',
    '생활용품',
  ];
  List<String> dropdownText = [
    '높은가격순',
    '낮은가격순',
    '인기많은순',
    '추천순',
  ];
  String selectedDropdown = '높은가격순';
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MarketBar(),
        leafletCard(),
        SizedBox(
          height: 17,
        ),
        TextTabBar(
          tabString: tabString,
          onChanged: (int value) {
            logger.d('tab을 클릭하셨습니다.$value');
          },
        ),
        _filter(),
        SizedBox(
          height: 30,
        ),
        ...List.generate(
            3,
            (rowIndex) => Row(
                  children: List.generate(
                    2,
                    (columnIndex) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 155 / 170,
                            child: Stack(children: [
                              Container(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                //  alignment: Alignment.center,
                                color: AppColors.grey(0xD9),
                                child: Icon(Icons.image, color: AppColors.grey(0x59)),
                              ),
                              Positioned(
                                left: 10,
                                top: 10,
                                child: Container(
                                  width: 60,
                                  height: 26,
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFFAD0921)),
                                  child: Center(
                                    child: Text(
                                      '다다익선',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 12,
                                bottom: 15,
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(0, 2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/app_11/ic_heart_off.png',
                                      width: 17,
                                      height: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          Text(
                            '한우1등급 등심 100g',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '000,000원',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey(0x6F),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '000,000원',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          coloredBoxText(label: '카드할인 00,000원', color: Color(0xffFE0404).withOpacity(0.63)),
                          coloredBoxText(label: '쿠폰할인 00,000원', color: Color(0xffFDC300)),
                          coloredBoxText(label: '추가할인혜택정보', color: Color(0xff112EC3)),
                          coloredBoxText(label: '01.01 ~ 01.01', color: Color(0xff3C3C3B)),
                        ],
                      ),
                    )),
                  ),
                ))
      ],
    );
  }

  Widget coloredBoxText({required Color color, required String label}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2,
      ),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(border: Border.all(width: 1, color: color)),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
      ),
    );
  }

  Padding _filter() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Row(
        children: [
          Text(
            '총 000개',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), border: Border.all(width: 1, color: AppColors.grey(0x7C))),
            child: DropdownButton<String>(
              isDense: true,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              borderRadius: BorderRadius.circular(12),
              isExpanded: false,
              icon: Padding(
                padding: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0, left: 3),
                child: Image.asset(
                  'assets/app_11/ic_arrow_down.png',
                  width: 12,
                  height: 6,
                ),
              ),
              //style: AppStyles.refundDropdownTextStyle.copyWith(color: Colors.black87),
              underline: SizedBox.shrink(),
              value: selectedDropdown,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.black),
              items: dropdownText.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(item),
                  ),
                );
              }).toList(),
              onChanged: (dynamic value) {
                setState(() {
                  selectedDropdown = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Container leafletCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(color: Color(0xffC2C4CD).withOpacity(0.42), borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/app_11/ic_nh_mark2.png',
                    width: 14,
                    height: 14,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '우리 동네 하나로마트 전단행사',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF292929)),
                  )
                ],
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '행사기간 : 2023.01.01. ~ 2023.01.31.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  ElevatedButton(
                      style: AppStyle.roundedElevatedButton.copyWith(
                          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 13)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff1C1F6B))),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text('다른전단보기'),
                          SizedBox(width: 3),
                          Image.asset(
                            'assets/app_11/ic_basket.png',
                            width: 14,
                            height: 14,
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 9,
                  ),
                  ElevatedButton(
                      style: AppStyle.roundedElevatedButton.copyWith(
                          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 13)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff066739))),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text('종이전단보기'),
                          SizedBox(width: 3),
                          Image.asset(
                            'assets/app_11/ic_image.png',
                            width: 14,
                            height: 14,
                          ),
                        ],
                      )),
                ],
              ),
              Text(
                '· 상품은 설정하신 마트를 방문하여 구매 가능합니다.',
                style: TextStyle(fontSize: 13),
              ),
              Text(
                '· 모든 상품의 행사 내용은 설정하신 점포에 한합니다.',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Image.asset(
              'assets/app_11/image_1.png',
            ),
          ),
        ],
      ),
    );
  }
}
