import 'package:flutter/material.dart';

class BlueRoundedContainer extends StatelessWidget {
  const BlueRoundedContainer({
    required this.child,
    this.subChild,
    this.subText = '',
    this.borderColor = Colors.black,
    super.key,
  });

  final Widget child;
  final Widget? subChild;
  final String subText;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: borderColor),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.3, -0.5),
                    end: Alignment(0.3, 0.5),
                    colors: [
                      Color(0xFF167CB3),
                      Color(0xFF45C386),
                    ],
                  ),
                ),
                child: subChild ??
                    Center(
                      child: Text(
                        subText,
                        style: TextStyle(
                          color: Color(0xFFFDFFFE),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
