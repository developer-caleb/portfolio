import 'package:flutter/material.dart';
import 'package:hanaromart/tools/grid_widget.dart';

class StampWidget extends StatelessWidget {
  const StampWidget({required this.totalNumber, required this.earnedStamps, Key? key}) : super(key: key);
  final int totalNumber;
  final int earnedStamps;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 0.50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridWidget(items: List.generate(totalNumber, (index) => _stamp(index)), columnNum: 5),
    );
  }

  Widget _stamp(
    int index,
  ) {
    Widget imageWidget = SizedBox.shrink();
    if (index < earnedStamps) {
      ///된 것 -> Color
      if (index >= (totalNumber - 1)) {
        imageWidget = StampFinalComplete();
      } else {
        imageWidget = StampNormalComplete();
      }
    } else {
      ///안 된 것 -> Grey
      if (index >= (earnedStamps - 1)) {
        imageWidget = StampFinal();
      } else {
        imageWidget = StampNormal();
      }
    }
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 11),
      child: imageWidget,
    ));
  }
}

class StampFinalComplete extends StatelessWidget {
  const StampFinalComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/app_23/ic_stamp_final_complete.png');
  }
}

class StampFinal extends StatelessWidget {
  const StampFinal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/app_23/ic_stamp_final.png');
  }
}

class StampNormal extends StatelessWidget {
  const StampNormal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/app_23/ic_stamp_normal.png');
  }
}

class StampNormalComplete extends StatelessWidget {
  const StampNormalComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/app_23/ic_stamp_normal_complete.png');
  }
}
