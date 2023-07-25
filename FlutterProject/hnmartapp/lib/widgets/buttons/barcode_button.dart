import 'package:flutter/material.dart';

class BarcodeButton extends StatelessWidget {
  const BarcodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/app_18/ic_barcode_button.png',
      width: 61,
      height: 30,
    );
  }
}
