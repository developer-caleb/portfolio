import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanaromart/config/app_style.dart';
import 'package:hanaromart/routes/router_name.dart';
import 'package:hanaromart/tools/logger.dart';
import 'package:hanaromart/widgets/bar/text_tabbar.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> tabList = ['전체', '기획전', '경품', '스탬프'];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: TextTabBar(
              tabString: tabList,
              onChanged: (int result) {
                logger.d('onClick $result');
                tabIndex = result;
              }),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            children: List.generate(3, (index) => eventCard(index)),
          ),
        )
      ],
    );
  }

  Widget eventCard(int index) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.EVENT_DETAIL, parameters: {'type': tabIndex.toString()});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 336 / 118,
                child: Placeholder(
                    // color: Colors.white,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              '하나로마트 양재점 6월 우수고객 초특가 상품 할인 이벤트',
              style: AppStyle.eventCardText,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              '2023-01-01 ~ 2023-01-31',
              style: AppStyle.eventCardText,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
