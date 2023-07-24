import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobis_pss_app/app/data/models/cart_item.dart';
import 'package:mobis_pss_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:mobis_pss_app/core/theme/color_theme.dart';
import 'package:mobis_pss_app/core/utils/marks.dart';
import 'package:url_launcher/url_launcher.dart';

class CartItemView extends GetView {
  final CartItem cartItem;
  final isChecked = false.obs;
  final qty = 1.obs;

  CartItemView({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    isChecked.value = cartItem.isChecked;
    qty.value = cartItem.qty;

    return GetX<CartController>(builder: (_) {
      return Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(children: [
                Checkbox(
                  onChanged: (bool? value) {
                    if (!value!) _.changeCheckAll(false);
                    cartItem.isChecked = value;
                    isChecked.value = value;
                    _.getTotal();
                  },
                  tristate: false,
                  value: isChecked.value,
                  activeColor: primaryColor,
                ),
                Text(
                  cartItem.krnm,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Expanded(child: SizedBox(width: 2)),
                GestureDetector(
                  child: Icon(Icons.clear),
                  onTap: () => _.removeItem(cartItem.seq),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    '${numberFormat.format(cartItem.price)} 원',
                    style: TextStyle(fontSize: 14),
                  ),
                  Expanded(child: SizedBox(width: 1)),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.black26,
                            onPressed: () {
                              if (cartItem.qty > 1) {
                                cartItem.qty -= 1;
                                qty.value = cartItem.qty;
                                _.getTotal();
                              }
                            },
                          ),
                        ),
                        Container(
                          child: Text(
                            numberFormat.format(qty.value),
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.add_circle),
                            color: Colors.black26,
                            onPressed: () {
                              if (cartItem.qty < 100) {
                                cartItem.qty += 1;
                                qty.value = cartItem.qty;
                                _.getTotal();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    '상품 금액: ',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '${numberFormat.format(cartItem.price * qty.value)} 원',
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color(0xFF004B87),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(cartItem.mutual, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: cartItem.tel.isNotEmpty
                  ? () {
                      launch('tel:${cartItem.tel}');
                    }
                  : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      cartItem.deliveryCode == 'D' ? '택배로 받기' : '방문 수령',
                      style: TextStyle(fontSize: 14),
                    ),
                    if (cartItem.tel.isNotEmpty) Text(' | ${cartItem.tel}'),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
