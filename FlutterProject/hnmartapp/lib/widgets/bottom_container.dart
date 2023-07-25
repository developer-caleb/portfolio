import 'package:flutter/material.dart';
import 'package:hanaromart/widgets/texts/check_label.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({required this.title, required this.item, super.key});
  final String title;
  final List<String> item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xFF8A91AA)),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GradientText(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              gradientType: GradientType.linear,
              gradientDirection: GradientDirection.btt,
              colors: [
                Color(0xff22988E),
                Color(0xff2A66AC),
              ],
            ),
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Color(0xFF167BB4),
          ),
          ...item.map((e) => CheckLabel(e)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
