import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobis_pss_app/app/modules/cart/views/cart_item_view.dart';
import 'package:mobis_pss_app/core/theme/color_theme.dart';
import 'package:mobis_pss_app/core/utils/marks.dart';
import 'package:mobis_pss_app/global_widgets/home_button.dart';
import 'package:mobis_pss_app/global_widgets/loading_indicator.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('장바구니'),
        centerTitle: true,
        actions: [HomeButton()],
      ),
      body: GetX<CartController>(
          builder: (_) {
            return Stack(children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      '부품 구매는 방문 수령/택배를 이용할 수 있으며,택배 수령시\n택배비가 추가로 청구될 수 있으니 판매점에 문의바랍니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Divider(color: Colors.black54),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Row(children: [
                              Checkbox(
                                onChanged: _.markAll,
                                tristate: false,
                                value: _.isCheckAll,
                                activeColor: primaryColor,
                              ),
                              Text(
                                '전체 선택',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ])),
                        Expanded(child: SizedBox(width: 10)),
                        Container(
                          height: 30,
                          padding: EdgeInsets.only(right: 20),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: primaryColor, //Color of the border
                                style: BorderStyle.solid, //Style of the border
                                width: 1, //width of the border
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.clear,
                                  color: primaryColor,
                                ),
                                Text(
                                  '선택 상품 삭제',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: _.removeItems,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black54),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: _.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        CartItemView(cartItem: _.items[index]),
                        Divider(color: Colors.black54),
                      ]);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Text(
                          '총 주문 금액',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(child: SizedBox(width: 10)),
                        Text(
                          '${numberFormat.format(_.currentTotal)} 원',
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            minimumSize: Size(Get.width / 1.1, 50),
                          ),
                          child: Text(
                            '구매요청',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: _.items.isNotEmpty ? _.request : null,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
              if (_.isLoading) Positioned(child: LoadingIndicator()),
            ]);
          }),
    );
  }
}
