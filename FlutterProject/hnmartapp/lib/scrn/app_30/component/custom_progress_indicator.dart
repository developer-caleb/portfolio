import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator(this.value, {super.key});
  final double value;
  final multiplicationFactor = 1000;
  @override
  Widget build(BuildContext context) {
    assert(value >= 0);
    assert(value <= 1);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFD9D9D9),
          ),
          child: Row(
            children: [
              if (value > 0)
                Expanded(
                  flex: (value * multiplicationFactor).toInt(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF03A64A),
                    ),
                  ),
                ),
              if (value < 1)
                Spacer(
                  flex: (multiplicationFactor * (1 - value)).toInt(),
                )
            ],
          ),
        )
      ],
    );
  }
}
