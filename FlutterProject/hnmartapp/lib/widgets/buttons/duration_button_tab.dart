import 'package:flutter/material.dart';

Widget buildTextButton({required String text, required bool selected, required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 9),
    child: TextButton(
      style: TextButton.styleFrom(
          foregroundColor: selected ? Colors.white : Colors.black,
          backgroundColor: selected ? Color(0xff27675F) : Colors.white,
          side: selected ? null : BorderSide(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () {
        onTap.call();
      },
      child: Text(text),
    ),
  );
}

class DurationButtonTab extends StatefulWidget {
  const DurationButtonTab({required this.valueChanged, super.key});
  final ValueChanged<int> valueChanged;
  @override
  State<DurationButtonTab> createState() => _DurationButtonTabState();
}

class _DurationButtonTabState extends State<DurationButtonTab> {
  List<String> durationList = ['3개월', '1개월', '1주일'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            durationList.length,
            (index) => buildTextButton(
                text: durationList[index],
                selected: index == selectedIndex,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.valueChanged(index);
                })));
  }
}
