import 'package:flutter/material.dart';

//GridView 또는 SliverGridView를 사용해도 괜찮지만,
//높이를 알 수 없는 상황이 있어서 해당 위젯 제작함
class GridWidget extends StatelessWidget {
  const GridWidget({required this.items, required this.columnNum, Key? key}) : super(key: key);
  final List<Widget> items;
  final int columnNum;
  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [];

    int n = (items.length / columnNum).ceil(); // n 계산

    for (int i = 0; i < n; i++) {
      int startIndex = i * columnNum;
      int endIndex = (i + 1) * columnNum;

      if (endIndex > items.length) {
        endIndex = items.length; // 아이템 개수보다 초과되는 경우 endIndex를 아이템 개수로 조정
      }

      List<Widget> rowItems = items.sublist(startIndex, endIndex);
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rowItems,
      ));
    }

    return Column(
      children: rows,
    );
  }
}
