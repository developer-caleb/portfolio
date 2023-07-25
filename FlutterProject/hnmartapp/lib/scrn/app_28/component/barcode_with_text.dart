import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeWithText extends StatelessWidget {
  const BarcodeWithText({this.barcodeText = '2936907654122', super.key});
  final String barcodeText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BarcodeWidget(
            width: double.maxFinite,
            height: 80,
            data: barcodeText,
            barcode: Barcode.ean13(),
            drawText: false,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            barcodeText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              letterSpacing: 4.94,
            ),
          ),
        ),
      ],
    );
  }
}
