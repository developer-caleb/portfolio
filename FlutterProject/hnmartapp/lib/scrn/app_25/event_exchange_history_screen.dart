import 'package:flutter/material.dart';
import 'package:hanaromart/scrn/app_25/event_exchange_list.dart';
import 'package:hanaromart/scrn/app_25/no_history.dart';
import 'package:hanaromart/widgets/default_screen.dart';

class EventExchangeHistoryScreen extends StatelessWidget {
  const EventExchangeHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(titleString: '이벤트', body: false ? NoHistory() : EventExchangeList()
        //body: Win(),
        );
  }
}
