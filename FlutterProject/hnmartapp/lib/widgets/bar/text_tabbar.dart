import 'package:flutter/material.dart';
import 'package:hanaromart/config/app_colors.dart';

class TextTabBar extends StatefulWidget {
  const TextTabBar({required this.tabString, required this.onChanged, Key? key, this.newList}) : super(key: key);
  final List<String> tabString;
  final List<int>? newList;
  final ValueChanged<int> onChanged;
  @override
  State<TextTabBar> createState() => _TextTabBarState();
}

class _TextTabBarState extends State<TextTabBar> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          widget.tabString.length,
          (index) => Flexible(
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      tabIndex = index;
                    });
                    widget.onChanged.call(index);
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
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
                          widget.tabString[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: tabIndex == index ? Color(0xff245E57) : AppColors.black0B0A0A),
                        ),
                      ),
                      if (widget.newList?.contains(index) ?? false)
                        Positioned(
                          top: 3,
                          right: 3,
                          child: Image.asset(
                            'assets/app_03/newicon.png',
                            width: 15,
                            height: 15,
                          ),
                        )
                    ],
                  ),
                ),
              )),
    );
  }
}
