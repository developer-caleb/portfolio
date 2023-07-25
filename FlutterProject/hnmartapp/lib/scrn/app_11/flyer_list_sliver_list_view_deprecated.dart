import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_colors.dart';
import 'package:hanaromart/config/app_style.dart';

class FlyerListSliver extends StatefulWidget {
  const FlyerListSliver({Key? key}) : super(key: key);

  @override
  State<FlyerListSliver> createState() => _FlyerListSliverState();
}

class _FlyerListSliverState extends State<FlyerListSliver> {
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              marketBar(),
              leafletCard(),
              SizedBox(
                height: 17,
              ),
              _customTabBar(),
              _filter(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //childAspectRatio: 0.5, // 아이템의 가로 세로 비율을 유지
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              mainAxisExtent: 200),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Stack(children: [
                      Container(
                        //  alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                          width: 45,
                          height: 26,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFFAD0921)),
                          child: Center(
                            child: Text(
                              '다다익선',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Text('한우1등급 등심 100g'),
                ],
              );
            },
            childCount: 10,
          ),
        )
      ],
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

  Row _customTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          tabString.length,
          (index) => Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      tabIndex = index;
                    });
                  },
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        padding: EdgeInsets.only(
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: tabIndex == index ? Color(0xff245E57) : Colors.transparent,
                          width: 3, // Underline thickness
                        ))),
                        child: Text(
                          tabString[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: tabIndex == index ? Color(0xff245E57) : AppColors.black0B0A0A),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )),
    );
  }

  Row marketBar() {
    return Row(
      children: [
        SizedBox(
          width: 12,
        ),
        Image.asset(
          'assets/app_03/ic_store_chage.png',
          width: 24,
          height: 24,
        ),
        SizedBox(width: 7),
        Text(
          '가좌농협 하나로마트',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, right: 10),
            child: ElevatedButton(style: AppStyle.roundedElevatedButton, onPressed: () {}, child: Text('단골매장변경'))),
      ],
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFF292929)),
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
                  fontSize: 14,
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
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '· 모든 상품의 행사 내용은 설정하신 점포에 한합니다.',
                style: TextStyle(fontSize: 12),
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
