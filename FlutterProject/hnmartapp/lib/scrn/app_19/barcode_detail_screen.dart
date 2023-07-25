import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class BarcodeDetailScreen extends StatelessWidget {
  const BarcodeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      titleString: '포인트 카드',
      hamburgerButton: false,
      body: RotatedBox(
        quarterTurns: -1,
        child: SizedBox(
          // width: Get.height,
          // height: Get.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 80, right: 40, top: 62, bottom: 43),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: SizedBox(
                    child: BarcodeWidget(
                      width: 500,
                      height: 195,
                      data: '2836907654123',
                      barcode: Barcode.ean13(),
                      drawText: false,
                    ),
                  ),
                ),
                Text(
                  '2836907654123',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 4.94,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
